import 'package:flutter/material.dart';

// Global theme notifier for the whole app
final ValueNotifier<String> appThemeNotifier = ValueNotifier('sophisticated-dark');

class PPTTopic {
  final String id;
  final String title;
  final String description;
  final String themeId;
  final PPTIntro intro;
  final List<PPTExplanation> explanations;
  final String youtubeId;
  final List<MCQQuestion> quizzes;
  final PPTSummary summary;

  PPTTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.themeId,
    required this.intro,
    required this.explanations,
    required this.youtubeId,
    required this.quizzes,
    required this.summary,
  });

  factory PPTTopic.fromJson(Map<String, dynamic> json) {
    return PPTTopic(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      themeId: json['themeId'] ?? 'sophisticated-dark',
      intro: PPTIntro.fromJson(json['intro'] ?? {}),
      explanations: (json['explanations'] as List? ?? [])
          .map((e) => PPTExplanation.fromJson(e))
          .toList(),
      youtubeId: json['youtubeId'] ?? '',
      quizzes: (json['quizzes'] as List? ?? [])
          .map((q) => MCQQuestion.fromJson(q))
          .toList(),
      summary: PPTSummary.fromJson(json['summary'] ?? {}),
    );
  }
}

class PPTIntro {
  final String title;
  final String subtitle;
  final String content;
  final List<String> keyConcepts;

  PPTIntro({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.keyConcepts,
  });

  factory PPTIntro.fromJson(Map<String, dynamic> json) {
    return PPTIntro(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      content: json['content'] ?? '',
      keyConcepts: List<String>.from(json['keyConcepts'] ?? []),
    );
  }
}

class PPTExplanation {
  final String title;
  final String subtitle;
  final String content;
  final String? imageUrl;
  final String layout; // New field: 'standard', 'split-left', 'split-right', 'focus-media', 'modern-grid'
  final Map<String, dynamic> interactiveWidget;

  PPTExplanation({
    required this.title,
    required this.subtitle,
    required this.content,
    this.imageUrl,
    this.layout = 'standard',
    required this.interactiveWidget,
  });

  factory PPTExplanation.fromJson(Map<String, dynamic> json) {
    return PPTExplanation(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'],
      layout: json['layout'] ?? 'standard',
      interactiveWidget: Map<String, dynamic>.from(json['interactiveWidget'] ?? {}),
    );
  }
}

class MCQQuestion {
  final String type;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  MCQQuestion({
    required this.type,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  factory MCQQuestion.fromJson(Map<String, dynamic> json) {
    return MCQQuestion(
      type: json['type'] ?? 'conceptual',
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctIndex: json['correctIndex'] ?? 0,
      explanation: json['explanation'] ?? '',
    );
  }
}

class PPTSummary {
  final String title;
  final List<String> keyTakeaways;
  final String classroomActivity;
  final String quickFact;

  PPTSummary({
    required this.title,
    required this.keyTakeaways,
    required this.classroomActivity,
    required this.quickFact,
  });

  factory PPTSummary.fromJson(Map<String, dynamic> json) {
    return PPTSummary(
      title: json['title'] ?? '',
      keyTakeaways: List<String>.from(json['keyTakeaways'] ?? []),
      classroomActivity: json['classroomActivity'] ?? '',
      quickFact: json['quickFact'] ?? '',
    );
  }
}

class PPTThemeHelper {
  static List<String> get availableThemes => [
    'ocean-tech',
    'sunset-minimal',
    'cyberpunk',
    'monochrome',
    'forest-organic',
    'sophisticated-dark',
  ];

  static ThemeData getThemeData(String themeId) {
    switch (themeId) {
      case 'ocean-tech':
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0F172A),
          primaryColor: const Color(0xFF10B981),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF10B981),
            secondary: Color(0xFF3B82F6),
            surface: Color(0xFF1E293B),
            onSurface: Colors.white,
          ),
          cardTheme: const CardTheme(
            color: Color(0xFF1E293B),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10B981),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w800, color: Colors.white),
            bodyMedium: TextStyle(fontFamily: 'Inter', color: Color(0xFFCBD5E1)),
          ),
        );
      case 'sunset-minimal':
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF18181B),
          primaryColor: const Color(0xFFF59E0B),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFF59E0B),
            secondary: Color(0xFFEC4899),
            surface: Color(0xFF27272A),
            onSurface: Color(0xFFFEF3C7),
          ),
          cardTheme: const CardTheme(
            color: Color(0xFF27272A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF59E0B),
              foregroundColor: Colors.black,
              shape: const StadiumBorder(),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'Playfair Display', fontWeight: FontWeight.bold, color: Color(0xFFFEF3C7)),
            bodyMedium: TextStyle(fontFamily: 'Inter', color: Color(0xFFD4D4D8)),
          ),
        );
      case 'cyberpunk':
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF09090B),
          primaryColor: const Color(0xFFD946EF),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFD946EF),
            secondary: Color(0xFF6366F1),
            surface: Color(0xFF18181B),
            onSurface: Color(0xFFE879F9),
          ),
          cardTheme: const CardTheme(
            color: Color(0xFF111114),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: Color(0xFFD946EF), width: 0.5),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD946EF),
              foregroundColor: Colors.white,
              shape: const BeveledRectangleBorder(),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.w900, color: Color(0xFFE879F9)),
            bodyMedium: TextStyle(fontFamily: 'JetBrains Mono', color: Color(0xFFE4E4E7)),
          ),
        );
      case 'monochrome':
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF171717),
          primaryColor: Colors.white,
          colorScheme: const ColorScheme.dark(
            primary: Colors.white,
            secondary: Color(0xFF737373),
            surface: Color(0xFF262626),
            onSurface: Colors.white,
          ),
          cardTheme: const CardTheme(
            color: Color(0xFF262626),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.white24),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w300, letterSpacing: 1.5, color: Colors.white),
            bodyMedium: TextStyle(fontFamily: 'Inter', color: Color(0xFFD4D4D8)),
          ),
        );
      case 'forest-organic':
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF1C1917),
          primaryColor: const Color(0xFFA3E635),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFA3E635),
            secondary: Color(0xFF84CC16),
            surface: Color(0xFF2E2A24),
            onSurface: Color(0xFFECFCCB),
          ),
          cardTheme: const CardTheme(
            color: Color(0xFF292524),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA3E635),
              foregroundColor: const Color(0xFF1C1917),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, color: Color(0xFFECFCCB)),
            bodyMedium: TextStyle(fontFamily: 'Inter', color: Color(0xFFD6D3D1)),
          ),
        );
      case 'sophisticated-dark':
      default:
        return ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF09090B),
          primaryColor: const Color(0xFF6366F1),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF6366F1),
            secondary: Color(0xFF312E81),
            surface: Color(0xFF18181B),
            onSurface: Colors.white,
          ),
          cardTheme: const CardTheme(
            color: Color(0xFF18181B),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w800, color: Colors.white),
            bodyMedium: TextStyle(fontFamily: 'Inter', color: Color(0xFFE4E4E7)),
          ),
        );
    }
  }
}

