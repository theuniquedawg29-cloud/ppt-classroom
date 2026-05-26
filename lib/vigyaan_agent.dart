import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'models/ppt_models.dart';
import 'data/vigyaan_scripts.dart';

enum VigyaanMode { idle, systemCommand, classroomTutor }
enum VigyaanState { dormant, listening, thinking, speaking, error }

class VigyaanAgent extends ChangeNotifier {
  final FlutterTts _tts = FlutterTts();
  final SpeechToText _stt = SpeechToText();
  VigyaanMode _mode = VigyaanMode.idle;
  VigyaanState _state = VigyaanState.dormant;

  PPTTopic? _currentTopic;
  PageController? _pageController;

  int _currentTutorSlideIndex = 0;
  bool _isInsideQuiz = false;
  final Map<int, int> _tutorSelectedAnswers = {};

  bool _awaitingVerbalQuizResponse = false;
  bool _isDeviceLocked = false;

  Timer? _idleTimer;
  int _idlePromptCount = 0;
  String _lastSpokenText = "";
  String _currentCaption = "";
  bool _showCaptions = true;

  VigyaanAgent() {
    _initTts();
    _initStt();
  }

  Future<void> _initStt() async {
    try {
      await _stt.initialize(
        onError: (val) => debugPrint('STT Error: $val'),
        onStatus: (val) {
          debugPrint('STT Status: $val');
          if (val == 'done' || val == 'notListening') {
            if (_state == VigyaanState.listening) {
              _state = VigyaanState.dormant;
              notifyListeners();
            }
          }
        },
      );
    } catch (e) {
      debugPrint("STT Init Error: $e");
    }
  }

  Future<void> _initTts() async {
    // Using hi-IN so the engine pronounces Hinglish naturally
    await _tts.setLanguage("hi-IN");

    try {
      List<dynamic> voices = await _tts.getVoices;
      for (var voice in voices) {
        String name = voice["name"].toString().toLowerCase();
        String locale = voice["locale"].toString();
        if (locale.contains("hi-in") && (name.contains("neural") || name.contains("enhanced"))) {
          await _tts.setVoice({"name": voice["name"], "locale": voice["locale"]});
          break;
        }
      }
    } catch (e) {
      debugPrint("Voice scanning error: $e");
    }

    await _tts.setPitch(1.0);
    // Slightly relaxed pace so the student can process the info
    await _tts.setSpeechRate(0.48);

    _tts.setStartHandler(() {
      _state = VigyaanState.speaking;
      notifyListeners();
    });

    _tts.setCompletionHandler(() async {
      _currentCaption = "";
      if (_mode == VigyaanMode.classroomTutor && _awaitingVerbalQuizResponse) {
        _state = VigyaanState.listening;
        _startIdleTimer();
        _startListening();
      } else {
        _state = VigyaanState.dormant;
      }
      notifyListeners();
    });

    _tts.setProgressHandler((String text, int start, int end, String word) {
      _currentCaption = text.substring(0, end);
      notifyListeners();
    });
  }

  VigyaanMode get mode => _mode;
  VigyaanState get state => _state;
  bool get isListening => _state == VigyaanState.listening;
  bool get isSpeaking => _state == VigyaanState.speaking;
  bool get isDeviceLocked => _isDeviceLocked;
  bool get showCaptions => _showCaptions;
  int get currentTutorSlideIndex => _currentTutorSlideIndex;
  String get lastSpokenText => _lastSpokenText;
  String get currentCaption => _currentCaption;
  Map<int, int> get tutorSelectedAnswers => _tutorSelectedAnswers;

  void toggleCaptions() {
    _showCaptions = !_showCaptions;
    notifyListeners();
  }

  void activateClassroomTutor(PPTTopic topic, PageController controller) {
    if (topic.title.isEmpty || topic.explanations.isEmpty) {
      _setError("Invalid topic data provided for tutoring.");
      return;
    }

    _mode = VigyaanMode.classroomTutor;
    _currentTopic = topic;
    _pageController = controller;
    _currentTutorSlideIndex = 0;
    _isDeviceLocked = true;
    _tutorSelectedAnswers.clear();
    _idlePromptCount = 0;

    _state = VigyaanState.thinking;
    notifyListeners();

    speakSlideContent();
  }

  void deactivateTutor() {
    _tts.stop();
    _stt.stop();
    _mode = VigyaanMode.idle;
    _state = VigyaanState.dormant;
    _isDeviceLocked = false;
    _awaitingVerbalQuizResponse = false;
    _isInsideQuiz = false;
    _idleTimer?.cancel();
    notifyListeners();
  }

  Future<void> speakSlideContent() async {
    if (_currentTopic == null) return;

    _currentCaption = "";
    String script = "";
    int expLen = _currentTopic!.explanations.length;
    int quizLen = _currentTopic!.quizzes.length;
    String topicId = _currentTopic!.id;

    // Fetch custom scripts if they exist
    List<List<String>>? topicScripts = VigyaanScripts.explanationScripts[topicId];

    if (_currentTutorSlideIndex == 0) {
      // Intro Slide
      if (topicScripts != null && topicScripts.isNotEmpty) {
        script = topicScripts[0].join(" ");
      } else {
        script = VigyaanScripts.getGenericIntro(_currentTopic!.title).join(" ");
      }
      script += " Agar aap ready ho, toh bas full energy mein bolo 'Yes' ya 'Ready'!";
      _awaitingVerbalQuizResponse = true;
    } else if (_currentTutorSlideIndex >= 1 && _currentTutorSlideIndex <= expLen) {
      // Explanation Slides
      final exp = _currentTopic!.explanations[_currentTutorSlideIndex - 1];
      if (topicScripts != null && _currentTutorSlideIndex < topicScripts.length) {
        script = topicScripts[_currentTutorSlideIndex].join(" ");
      } else {
        script = VigyaanScripts.getGenericExplanation(exp.title).join(" ");
      }
      script += " Bheje mein ghusa ya upar se gaya? Bindaas batao. 'Aage badho' ya 'Repeat'!";
      _awaitingVerbalQuizResponse = true;
    } else if (_currentTutorSlideIndex == expLen + 1) {
      // Video Slide
      script =
          "Sahi jaa rahe ho! Ab thoda dimaag ko aaram dete hain aur ye short video dekhte hain. "
          "Isse concept aur clear ho jayega. Video dekhne ke baad 'Next' bol dena!";
      _awaitingVerbalQuizResponse = true;
    } else if (_currentTutorSlideIndex >= expLen + 2 &&
        _currentTutorSlideIndex <= expLen + quizLen + 1) {
      // Quiz Slides
      final quizIndex = _currentTutorSlideIndex - (expLen + 2);
      final quiz = _currentTopic!.quizzes[quizIndex];
      _isInsideQuiz = true;

      // Dynamic quiz options reading
      String optionsStr = "";
      if (quiz.options.length >= 4) {
        optionsStr = "A: ${quiz.options[0]}, B: ${quiz.options[1]}, C: ${quiz.options[2]}, ya D: ${quiz.options[3]}";
      }

      script =
          "Time for a mini-quiz! Darna mat, koi negative marking nahi hai. "
          "Sawal ye raha: ${quiz.question}. "
          "Options hain: $optionsStr. "
          "Tukka bhi maar sakte ho! Batao A, B, C, ya D?";
      _awaitingVerbalQuizResponse = true;
    } else {
      // Summary / Conclusion
      script =
          "Kya baat hai! Aaj ka topic humne milkar fod diya! You did a fantastic job. "
          "Screen par summary dekh lo. Agar class khatam karni hai toh bolo 'Bye' ya 'Done'!";
      _awaitingVerbalQuizResponse = true;
    }

    _speak(script);
  }

  void _speak(String text) async {
    _lastSpokenText = text;
    _currentCaption = "";
    // Stop listening before speaking to avoid echo
    await _stt.stop();
    notifyListeners();
    await _tts.speak(text);
  }

  Future<void> _startListening() async {
    if (!_stt.isAvailable) {
      await _initStt();
    }
    
    if (_stt.isAvailable && !_stt.isListening) {
      _state = VigyaanState.listening;
      notifyListeners();
      
      await _stt.listen(
        onResult: (result) {
          if (result.finalResult) {
            injectVerbalInput(result.recognizedWords);
          }
        },
        listenOptions: SpeechListenOptions(
          localeId: "hi-IN",
          cancelOnError: true,
          listenMode: ListenMode.confirmation,
        ),
      );
    }
  }

  void injectVerbalInput(String input) {
    _resetIdleTimer();
    _idlePromptCount = 0;

    if (_mode == VigyaanMode.classroomTutor) {
      _handleTutorInput(input);
    }
  }

  void _handleTutorInput(String input) {
    final text = input.toLowerCase();

    // Handling Identity/Creator Queries
    if (text.contains("who created") || text.contains("kisne banaya") || 
        text.contains("who taught") || text.contains("kisne sikhaya") ||
        text.contains("who are you") || text.contains("kaun ho")) {
      _speakResponse("Mujhe Santosh TechWorks ke Santosh ne banaya aur sikhaya hai. Main Vigyaan hoon, aapki digital mentor!");
      return;
    }

    // 1. Handling doubts, "repeat", or "didn't understand"
    if (text.contains("no") || text.contains("repeat") || text.contains("nahi aaya") ||
        text.contains("hard") || text.contains("phir se") || text.contains("upar se gaya")) {

      String reassurance = "Arre koi na! Ye concept thoda 'bouncing ball' jaisa hai, pehli baar mein catch nahi hota. "
          "Main isko aur simple karke samjhata hoon. Dhyan se sunna...";
      _speakResponse(reassurance, resumeLecture: true);
      return;
    }

    // 2. Quiz Handling
    if (_isInsideQuiz) {
      _processQuizResponse(text);
      return;
    }

    // 3. Positive Progression
    if (text.contains("yes") || text.contains("clear") || text.contains("ready") ||
        text.contains("next") || text.contains("aage") || text.contains("chalo") || text.contains("samajh")) {
      _advanceTutorFlow(prefix: "Awesome! Chalo aage badhte hain.");
      return;
    }
    // 4. Exit/Done condition
    else if (text.contains("bye") || text.contains("done") || text.contains("khatam")) {
      _speakResponse("Chalo milte hain agli class mein. Bye bye!");
      deactivateTutor();
      return;
    }
    
    // 5. Out of Context Fallback
    _speakResponse("Sorry, but Santosh ne abhi tak iske bare me bataya nhi hai.. Main abhi bhi sikh rahi, sayad future me bata paun..");
  }

  void _processQuizResponse(String text) {
    final expLen = _currentTopic!.explanations.length;
    final quizIndex = _currentTutorSlideIndex - (expLen + 2);
    final quiz = _currentTopic!.quizzes[quizIndex];

    int? userChoice;
    if (RegExp(r'\ba\b|option a|pehla|first').hasMatch(text)) {
      userChoice = 0;
    } else if (RegExp(r'\bb\b|option b|doosra|second').hasMatch(text)) {
      userChoice = 1;
    } else if (RegExp(r'\bc\b|option c|teesra|third').hasMatch(text)) {
      userChoice = 2;
    } else if (RegExp(r'\bd\b|option d|chautha|fourth').hasMatch(text)) {
      userChoice = 3;
    }

    if (userChoice != null) {
      _isInsideQuiz = false;
      _tutorSelectedAnswers[quizIndex] = userChoice;
      notifyListeners();

      bool isCorrect = userChoice == quiz.correctIndex;

      // Fun, empathetic feedback
      String response = isCorrect
          ? "Ekdum jhakas! Bilkul sahi jawab. "
          : "Good try yaar! Par is baar option ${String.fromCharCode(65 + quiz.correctIndex)} sahi tha. ";

      response += "${quiz.explanation}. Chalo, next slide par chalte hain!";
      _advanceTutorFlow(prefix: response);
    } else {
      _speakResponse("Main sun nahi paaya thik se. Kaunsa option lock kiya jaye? A, B, C, ya D?");
    }
  }

  void _advanceTutorFlow({String? prefix}) async {
    if (_pageController == null || _currentTopic == null) return;

    if (prefix != null) {
      _awaitingVerbalQuizResponse = false;
      await _tts.speak(prefix);
    }

    _currentTutorSlideIndex++;
    int totalSlides = 3 + _currentTopic!.explanations.length + _currentTopic!.quizzes.length;

    if (_currentTutorSlideIndex < totalSlides) {
      _pageController!.animateToPage(
        _currentTutorSlideIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
      speakSlideContent();
    } else {
      _speakResponse("Aaj ki class super hit rahi! Aise hi padhte raho. Milte hain agli baar!");
      deactivateTutor();
    }
  }

  void _speakResponse(String text, {bool resumeLecture = false}) async {
    await _tts.speak(text);
    if (resumeLecture) {
      speakSlideContent();
    }
  }

  // --- GENTLE, HUMOROUS IDLE HANDLING ---
  void _startIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(const Duration(seconds: 15), () {
      if (_state == VigyaanState.listening && _mode == VigyaanMode.classroomTutor) {
        _idlePromptCount++;

        if (_idlePromptCount == 1) {
          _speak("Aaram se soch lo. Koi jaldi nahi hai. Jab answer ready ho tab bata dena.");
        } else if (_idlePromptCount == 2) {
          _speak("Hello? Network chala gaya kya? Agar sawal zyada hard lag raha hai toh bas bol do 'Repeat'. Main help kar dunga.");
        } else {
          // If completely silent after 3 attempts
          _speak("Lagta hai aap Maggi banane chale gaye ho. Main class yahi pause karta hoon. Aakar mic tap kar dena!");
          _state = VigyaanState.dormant;
          notifyListeners();
          return;
        }
        _startIdleTimer();
      }
    });
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel();
  }

  void _setError(String msg) {
    _state = VigyaanState.error;
    _lastSpokenText = msg;
    notifyListeners();
  }

  @override
  void dispose() {
    _tts.stop();
    _idleTimer?.cancel();
    super.dispose();
  }
}
