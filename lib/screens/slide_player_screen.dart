import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show File, Platform, Directory;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;
import 'package:flutter_pptx/flutter_pptx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import '../models/ppt_models.dart';

class SlidePlayerScreen extends StatefulWidget {
  final PPTTopic topic;
  final String preferredLayout;
  const SlidePlayerScreen({super.key, required this.topic, this.preferredLayout = 'standard'});

  @override
  State<SlidePlayerScreen> createState() => _SlidePlayerScreenState();
}

class _SlidePlayerScreenState extends State<SlidePlayerScreen> {
  late PageController _pageController;
  int _currentSlideIndex = 0;
  late String _currentLayout;
  YoutubePlayerController? _ytController;

  // MCQ state trackers
  final Map<int, int> _selectedAnswers = {};
  final Map<int, bool> _showExplanations = {};

  // Interactive widgets states
  bool _isStomataOpen = false;
  double _surfaceMultiplier = 5.0;
  double _tiltAngle = 30.0;
  bool _isChemBalanced = false;

  late int _totalSlides;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentLayout = widget.preferredLayout;
    _totalSlides = 3 + widget.topic.explanations.length + widget.topic.quizzes.length;

    // Initialize YouTube Controller if ID is present
    if (widget.topic.youtubeId.isNotEmpty) {
      final videoId = YoutubePlayerController.convertUrlToId(widget.topic.youtubeId) ?? widget.topic.youtubeId;
      _ytController = YoutubePlayerController.fromVideoId(
        videoId: videoId,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          mute: false,
          showVideoAnnotations: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    // In youtube_player_iframe 5.x, the controller doesn't have a dispose() method.
    // It's recommended to let it be garbage collected or use close() if available.
    super.dispose();
  }

  void _navigateToSlide(int index) {
    if (index >= 0 && index < _totalSlides) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _downloadPPTX(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        backgroundColor: Color(0xFF111827),
        title: Text("Exporting PPTX...", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(color: Colors.indigoAccent),
            SizedBox(height: 16),
            Text("Building presentation layers...", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );

    try {
      // Create a new PowerPoint presentation using flutter_pptx
      final pres = FlutterPowerPoint();
      final themeData = PPTThemeHelper.getThemeData(appThemeNotifier.value);

      // We will use addWidgetSlide for high-fidelity rendering
      for (int i = 0; i < _totalSlides; i++) {
        await pres.addWidgetSlide(
          (size) => Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: themeData.scaffoldBackgroundColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  themeData.scaffoldBackgroundColor,
                  themeData.colorScheme.surface,
                ],
              ),
            ),
            child: Theme(
              data: themeData,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 800),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSlideHeader(themeData),
                                const SizedBox(height: 12),
                                _getSlideBody(i, themeData, widget.topic.explanations.length, widget.topic.quizzes.length),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "Created by Santosh TechWorks | Slide ${i + 1} of $_totalSlides",
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          delay: const Duration(milliseconds: 1500),
          context: context,
        );
      }

      // Save and Download
      final Uint8List? bytes = await pres.save();

      if (context.mounted) Navigator.pop(context);
      if (bytes == null) throw Exception("Failed to generate PPTX bytes");

      final String fileName = "${widget.topic.title.replaceAll(' ', '_')}.pptx";

      if (context.mounted) {
        _showExportOptions(context, bytes, fileName);
      }
    } catch (e) {
      if (context.mounted) {
        if (Navigator.canPop(context)) Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Export failed: $e")));
      }
    }
  }

  void _showExportOptions(BuildContext context, Uint8List bytes, String fileName) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111827),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Presentation Ready", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          ListTile(
            leading: const Icon(Icons.share, color: Colors.indigoAccent),
            title: const Text("Share as File (PPTX)", style: TextStyle(color: Colors.white)),
            subtitle: const Text("Best for offline editing in MS PowerPoint", style: TextStyle(color: Colors.grey, fontSize: 11)),
            onTap: () async {
              Navigator.pop(context);
              await _shareAsFile(bytes, fileName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud_done, color: Colors.greenAccent),
            title: const Text("Open on Web (Google Slides Link)", style: TextStyle(color: Colors.white)),
            subtitle: const Text("Generates a link to view presentation online", style: TextStyle(color: Colors.grey, fontSize: 11)),
            onTap: () async {
              Navigator.pop(context);
              _handleWebExport(context, bytes, fileName);
            },
          ),
          if (kIsWeb)
            ListTile(
              leading: const Icon(Icons.download, color: Colors.amberAccent),
              title: const Text("Download Directly", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _downloadWeb(bytes, fileName);
              },
            ),
          if (!kIsWeb && Platform.isWindows)
            ListTile(
              leading: const Icon(Icons.download, color: Colors.amberAccent),
              title: const Text("Save to Downloads Folder", style: TextStyle(color: Colors.white)),
              onTap: () async {
                Navigator.pop(context);
                await _saveToWindowsDownloads(bytes, fileName, context);
              },
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Future<void> _saveToWindowsDownloads(Uint8List bytes, String fileName, BuildContext context) async {
    try {
      final downloadsDir = await getDownloadsDirectory();
      if (downloadsDir != null) {
        final filePath = '${downloadsDir.path}/$fileName';
        final file = File(filePath);
        await file.writeAsBytes(bytes);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Saved to Downloads: $fileName"),
              duration: const Duration(seconds: 10),
              action: SnackBarAction(
                label: "Open File",
                textColor: Colors.amberAccent,
                onPressed: () {
                  final fileUri = Uri.file(file.absolute.path);
                  launchUrl(fileUri, mode: LaunchMode.externalApplication);
                },
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to save: $e")));
      }
    }
  }

  Future<void> _shareAsFile(Uint8List bytes, String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(bytes);
    await Share.shareXFiles([XFile(file.path)], text: 'Check out this presentation: ${widget.topic.title}');
  }

  void _downloadWeb(Uint8List bytes, String fileName) {
    final blob = html.Blob([bytes], 'application/vnd.openxmlformats-officedocument.presentationml.presentation');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = fileName;
    html.document.body!.append(anchor);
    anchor.click();
    anchor.remove();
    html.Url.revokeObjectUrl(url);
  }

  Future<void> _handleWebExport(BuildContext context, Uint8List bytes, String fileName) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        backgroundColor: Color(0xFF111827),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.greenAccent),
            SizedBox(height: 16),
            Text("Uploading to cloud viewer...", style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );

    try {
      final String? webLink = await _uploadToFileIo(bytes, fileName);
      if (context.mounted) Navigator.pop(context);

      if (webLink != null) {
        // Construct Google Docs Viewer URL
        final String viewerUrl = "https://docs.google.com/viewer?url=$webLink";
        
        if (context.mounted) {
          _showLinkDialog(context, viewerUrl);
        }
      } else {
        throw Exception("Could not generate cloud link.");
      }
    } catch (e) {
      if (context.mounted) {
        if (Navigator.canPop(context)) Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Web Export failed: $e")));
      }
    }
  }

  Future<String?> _uploadToFileIo(Uint8List bytes, String fileName) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse('https://file.io'))
        ..files.add(http.MultipartFile.fromBytes('file', bytes, filename: fileName));
      
      final response = await request.send();
      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final json = jsonDecode(respStr);
        return json['link'];
      }
    } catch (e) {
      debugPrint("Upload error: $e");
    }
    return null;
  }

  void _showLinkDialog(BuildContext context, String viewerUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF111827),
        title: const Text("Web View Ready", style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your presentation is hosted and can be viewed online.", style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 16),
            SelectableText(viewerUrl, style: const TextStyle(color: Colors.indigoAccent, fontSize: 11)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),
            onPressed: () {
              launchUrl(Uri.parse(viewerUrl), mode: LaunchMode.externalApplication);
              Navigator.pop(context);
            },
            child: const Text("Open in Browser"),
          ),
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: appThemeNotifier,
      builder: (context, themeId, child) {
        final themeData = PPTThemeHelper.getThemeData(themeId);
        final accentText = themeData.colorScheme.primary;

        return Theme(
          data: themeData,
          child: Scaffold(
            backgroundColor: themeData.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                widget.topic.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.layers, color: Colors.white, size: 20),
                  tooltip: "Switch Layout",
                  onPressed: () => _showLiveLayoutSwitcher(context),
                ),
                IconButton(
                  icon: const Icon(Icons.download_for_offline, color: Colors.white),
                  tooltip: "Export PPTX Presentation",
                  onPressed: () => _downloadPPTX(context),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Center(
                    child: Text(
                      "Slide ${_currentSlideIndex + 1} / $_totalSlides",
                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                // PRIMARY SLIDE PAGEVIEW
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (idx) {
                          setState(() {
                            _currentSlideIndex = idx;
                          });
                        },
                        itemCount: _totalSlides,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: Padding(
                                    key: ValueKey("slide_$index"),
                                    padding: const EdgeInsets.all(16.0),
                                    child: _buildSlideContent(index, themeData),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Created by Santosh TechWorks",
                                  style: TextStyle(color: Colors.white24, fontSize: 9, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // NAVIGATION AND DOTS BAR
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    border: const Border(top: BorderSide(color: Colors.white10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button
                      ElevatedButton(
                        onPressed: _currentSlideIndex > 0 ? () => _navigateToSlide(_currentSlideIndex - 1) : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.white.withOpacity(0.02),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("Previous", style: TextStyle(fontSize: 12)),
                      ),

                      // Horizontal navigation indicator dots
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_totalSlides, (i) {
                              final isCurrent = i == _currentSlideIndex;
                              final quizStartIndex = 2 + widget.topic.explanations.length;
                              final quizEndIndex = 1 + widget.topic.explanations.length + widget.topic.quizzes.length;
                              final isQuiz = i >= quizStartIndex && i <= quizEndIndex;
                              
                              return InkWell(
                                onTap: () => _navigateToSlide(i),
                                child: Container(
                                  width: isCurrent ? 12 : 6,
                                  height: 6,
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: isCurrent
                                        ? accentText
                                        : (isQuiz ? Colors.redAccent.withOpacity(0.4) : Colors.white30),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),

                      // Next button
                      ElevatedButton(
                        onPressed: _currentSlideIndex < _totalSlides - 1 ? () => _navigateToSlide(_currentSlideIndex + 1) : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeData.colorScheme.primary,
                          foregroundColor: themeData.colorScheme.onPrimary,
                          disabledBackgroundColor: Colors.white.withOpacity(0.02),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          _currentSlideIndex == _totalSlides - 1 ? "Finish" : "Next",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // BUILD INDIVIDUAL SLIDES RENDERER
  Widget _buildSlideContent(int index, ThemeData theme) {
    int expLen = widget.topic.explanations.length;
    int quizLen = widget.topic.quizzes.length;

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSlideHeader(theme),
          const SizedBox(height: 12),
          _getSlideBody(index, theme, expLen, quizLen),
        ],
      ),
    );
  }

  Widget _buildSlideHeader(ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.topic.title,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.topic.description,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSlideBody(int index, ThemeData theme, int expLen, int quizLen) {
    if (index == 0) {
      return _buildIntroSlide(theme);
    } else if (index >= 1 && index <= expLen) {
      return _buildExplanationSlide(index - 1, theme);
    } else if (index == expLen + 1) {
      return _buildVideoSlide(theme);
    } else if (index >= expLen + 2 && index <= expLen + quizLen + 1) {
      return _buildQuizSlide(index - (expLen + 2), theme);
    } else {
      return _buildSummarySlide(theme);
    }
  }

  // SLIDE 0: INTRODUCTORY HERO COVER PAGE SCREEN
  Widget _buildIntroSlide(ThemeData theme) {
    final intro = widget.topic.intro;
    return Card(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
              ),
              child: Text(
                intro.subtitle.toUpperCase(),
                style: TextStyle(color: theme.colorScheme.primary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              intro.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.2),
            ),
            const SizedBox(height: 16),
            Text(
              intro.content,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[200], fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 6),
                Text("Key Concepts covered:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: intro.keyConcepts.map((concept) {
                return Chip(
                  label: Text(concept, style: const TextStyle(fontSize: 12)),
                  backgroundColor: Colors.white.withOpacity(0.04),
                  side: const BorderSide(color: Colors.white12),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // SLIDE 1-4: EXPLANATORY CORNER PANELS WITH INTERACTIVES
  Widget _buildExplanationSlide(int expIndex, ThemeData theme) {
    if (expIndex >= widget.topic.explanations.length) {
      return const Center(child: Text("Explanation slide index out of range"));
    }
    final exp = widget.topic.explanations[expIndex];
    
    // Use the global preferred layout chosen by the user
    switch (_currentLayout) {
      case 'split-right':
        return _layoutSplit(exp, theme, imageOnRight: true);
      case 'split-left':
        return _layoutSplit(exp, theme, imageOnRight: false);
      case 'focus-media':
        return _layoutFocusMedia(exp, theme);
      case 'modern-grid':
        return _layoutModernGrid(exp, theme);
      case 'magazine':
        return _layoutMagazine(exp, theme);
      case 'standard':
      default:
        return _layoutStandard(exp, theme);
    }
  }

  Widget _layoutStandard(PPTExplanation exp, ThemeData theme) {
    return Column(
      children: [
        _buildContentCard(exp, theme),
        const SizedBox(height: 16),
        _buildInteractiveWidget(exp.interactiveWidget, theme),
      ],
    );
  }

  Widget _layoutSplit(PPTExplanation exp, ThemeData theme, {required bool imageOnRight}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!imageOnRight) Expanded(flex: 2, child: _buildImageContainer(exp, theme, height: 400)),
            if (!imageOnRight) const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildTextOnlyCard(exp, theme),
                  const SizedBox(height: 12),
                  _buildInteractiveWidget(exp.interactiveWidget, theme),
                ],
              ),
            ),
            if (imageOnRight) const SizedBox(width: 16),
            if (imageOnRight) Expanded(flex: 2, child: _buildImageContainer(exp, theme, height: 400)),
          ],
        ),
      ],
    );
  }

  Widget _layoutFocusMedia(PPTExplanation exp, ThemeData theme) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              _buildImageContainer(exp, theme, height: 350),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.title,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
                    ),
                    const SizedBox(height: 10),
                    Text(exp.content, style: const TextStyle(fontSize: 14, height: 1.6)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildInteractiveWidget(exp.interactiveWidget, theme),
      ],
    );
  }

  Widget _layoutModernGrid(PPTExplanation exp, ThemeData theme) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: _buildContentCard(exp, theme),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(child: _buildInteractiveWidget(exp.interactiveWidget, theme)),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.lightbulb, color: theme.colorScheme.primary),
                          const SizedBox(height: 8),
                          const Text("PRO TIP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                          const SizedBox(height: 4),
                          const Text("Interact with the simulation to see real-time effects!", textAlign: TextAlign.center, style: TextStyle(fontSize: 9)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _layoutMagazine(PPTExplanation exp, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exp.title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: theme.colorScheme.primary, letterSpacing: -1),
        ),
        const Divider(thickness: 3, color: Colors.white10),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                exp.content,
                style: const TextStyle(fontSize: 16, height: 1.8, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildImageContainer(exp, theme),
                  const SizedBox(height: 16),
                  _buildInteractiveWidget(exp.interactiveWidget, theme),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showLiveLayoutSwitcher(BuildContext context) {
    final layouts = [
      {'id': 'standard', 'name': 'Standard', 'icon': Icons.view_stream},
      {'id': 'split-left', 'name': 'Split Left', 'icon': Icons.view_quilt},
      {'id': 'split-right', 'name': 'Split Right', 'icon': Icons.view_sidebar},
      {'id': 'focus-media', 'name': 'Focus Media', 'icon': Icons.filter_frames},
      {'id': 'modern-grid', 'name': 'Bento Grid', 'icon': Icons.grid_view},
      {'id': 'magazine', 'name': 'Magazine', 'icon': Icons.article},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111827),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Switch Layout Style", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: layouts.map((l) {
                  final isSelected = _currentLayout == l['id'];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _currentLayout = l['id'] as String;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.indigoAccent : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isSelected ? Colors.white : Colors.white10),
                      ),
                      child: Column(
                        children: [
                          Icon(l['icon'] as IconData, color: Colors.white),
                          const SizedBox(height: 8),
                          Text(l['name'] as String, style: const TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContentCard(PPTExplanation exp, ThemeData theme) {
    return Card(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.white10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exp.subtitle.toUpperCase(),
              style: TextStyle(color: theme.colorScheme.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
            const SizedBox(height: 8),
            Text(
              exp.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              exp.content,
              style: TextStyle(color: Colors.grey[300], fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 16),
            _buildImageContainer(exp, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTextOnlyCard(PPTExplanation exp, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exp.title,
              style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              exp.content,
              style: const TextStyle(fontSize: 12, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(PPTExplanation exp, ThemeData theme, {double? height}) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 120, maxHeight: height ?? 240),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05), style: BorderStyle.solid),
      ),
      child: exp.imageUrl != null && exp.imageUrl!.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: exp.imageUrl!.startsWith('assets/')
                  ? Image.asset(
                      exp.imageUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(theme),
                    )
                  : Image.network(
                      exp.imageUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(theme),
                    ),
            )
          : _buildImagePlaceholder(theme),
    );
  }

  Widget _buildImagePlaceholder(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.image_outlined, color: theme.colorScheme.primary.withOpacity(0.3), size: 40),
        const SizedBox(height: 8),
        Text(
          "Educational Diagram / Image Placeholder",
          style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 10, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  // INTERACTIVE WIDGET SWITCHBOARD BUILDER
  Widget _buildInteractiveWidget(Map<String, dynamic> widgetData, ThemeData theme) {
    final type = widgetData['type'] ?? '';
    final configType = (widgetData['config']?['type'] ?? '').toString();

    if (type == 'interactive-cards') {
      final items = widgetData['config']?['items'] as List? ?? [];
      return Card(
        color: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.white10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widgetData['title'] ?? 'Module Details',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
              ),
              const SizedBox(height: 12),
              ...items.map<Widget>((item) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'] ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(item['desc'] ?? item['description'] ?? '', style: const TextStyle(color: Colors.grey, fontSize: 12, height: 1.3)),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      );
    }

    if (configType == 'stomata-state' || type == 'diagram') {
      return Card(
        color: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widgetData['title'] ?? 'Interactive Stomatal Pore State',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Guard Cell Left
                  Transform.rotate(
                    angle: _isStomataOpen ? -0.2 : 0,
                    child: Container(
                      width: 40,
                      height: 100,
                      decoration: BoxDecoration(
                        color: _isStomataOpen ? Colors.green : Colors.teal.shade800,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24, width: 2),
                      ),
                      child: const Center(child: Text("H2O", style: TextStyle(fontSize: 9, color: Colors.white54))),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Stomatal Pore Space
                  Container(
                    width: _isStomataOpen ? 45 : 4,
                    height: 80,
                    decoration: BoxDecoration(
                      color: _isStomataOpen ? Colors.black87 : Colors.black45,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _isStomataOpen
                        ? const Center(child: Text("CO2", style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold)))
                        : null,
                  ),
                  const SizedBox(width: 12),
                  // Guard Cell Right
                  Transform.rotate(
                    angle: _isStomataOpen ? 0.2 : 0,
                    child: Container(
                      width: 40,
                      height: 100,
                      decoration: BoxDecoration(
                        color: _isStomataOpen ? Colors.green : Colors.teal.shade800,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24, width: 2),
                      ),
                      child: const Center(child: Text("H2O", style: TextStyle(fontSize: 9, color: Colors.white54))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                _isStomataOpen ? "State: Pore Hydrated & Open (CO2 Assimilates)" : "State: Flaccid & Shut (Conserving moisture)",
                style: TextStyle(color: _isStomataOpen ? Colors.greenAccent : Colors.grey, fontSize: 11),
              ),
              Switch(
                value: _isStomataOpen,
                activeTrackColor: Colors.green,
                onChanged: (val) {
                  setState(() {
                    _isStomataOpen = val;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    if (configType == 'surface-area-slider' || type == 'simulation') {
      return Card(
        color: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widgetData['title'] ?? 'Dynamic Surface Foliage Multiplier',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
              ),
              const SizedBox(height: 16),
              // Grid visualizing folding density
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: List.generate((_surfaceMultiplier * 7).toInt(), (i) {
                  return Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Text(
                "Memebrane Scale Multiplier: ${_surfaceMultiplier.toStringAsFixed(1)}x space density",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              Slider(
                value: _surfaceMultiplier,
                min: 1.0,
                max: 10.0,
                divisions: 9,
                activeColor: theme.colorScheme.primary,
                onChanged: (val) {
                  setState(() {
                    _surfaceMultiplier = val;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    if (configType == 'chemical-equation') {
      return Card(
        color: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widgetData['title'] ?? 'Stoichiometric Chemistry Balance',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isChemBalanced = !_isChemBalanced;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: _isChemBalanced ? Colors.green : Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _isChemBalanced ? "Balanced (Reactants = Products)" : "Unbalanced Formula",
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                _isChemBalanced
                    ? "✓ Mass conserved! Equal atoms verified."
                    : "⚠️ Stoichiometry mismatch! Proportions are unequal.",
                style: TextStyle(color: _isChemBalanced ? Colors.greenAccent : Colors.grey, fontSize: 10),
              )
            ],
          ),
        ),
      );
    }

    if (configType == 'angle-ratio-slider' || type == 'slider') {
      final rad = (_tiltAngle * math.pi) / 180;
      final sineRatio = math.sin(rad);
      return Card(
        color: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widgetData['title'] ?? 'Launch Incline Vectors & Slopes',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
              ),
              const SizedBox(height: 20),
              // Drawn triangle representing gravity hill / geometry vector
              SizedBox(
                height: 100,
                width: 160,
                child: CustomPaint(
                  painter: InclinePainter(angleDegrees: _tiltAngle, accentColor: theme.colorScheme.primary),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Angle: ${_tiltAngle.toInt()}°", style: const TextStyle(color: Colors.white, fontSize: 11)),
                  Text("Sine Projection: ${sineRatio.toStringAsFixed(3)}", style: const TextStyle(color: Colors.amber, fontSize: 11)),
                ],
              ),
              Slider(
                value: _tiltAngle,
                min: 0.0,
                max: 90.0,
                divisions: 90,
                activeColor: theme.colorScheme.primary,
                onChanged: (val) {
                  setState(() {
                    _tiltAngle = val;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }

    // Default Fallback
    return const SizedBox.shrink();
  }

  // SLIDE 5: ACCOMPANYING CLASSROOM EDUCATIONAL VIDEO ATTACHED
  Widget _buildVideoSlide(ThemeData theme) {
    if (_ytController == null) {
      return const Center(child: Text("No video lesson available for this topic."));
    }

    return Card(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.video_library, color: Colors.red, size: 24),
                const SizedBox(width: 10),
                Text(
                  "Embedded Lesson Player",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (!kIsWeb && Platform.isWindows)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Video playback is not supported on Windows Desktop yet.\nUse the web version or open externally.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YoutubePlayer(
                    controller: _ytController!,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!(!kIsWeb && Platform.isWindows))
                  ElevatedButton.icon(
                    onPressed: () => _ytController?.enterFullScreen(),
                    icon: const Icon(Icons.fullscreen),
                    label: const Text("Full Screen"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                if (!(!kIsWeb && Platform.isWindows)) const SizedBox(width: 8),
                if (!(!kIsWeb && Platform.isWindows))
                  ElevatedButton.icon(
                    onPressed: () => _ytController?.exitFullScreen(),
                    icon: const Icon(Icons.fullscreen_exit),
                    label: const Text("Exit Full Screen"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                if (!(!kIsWeb && Platform.isWindows)) const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    final videoId = YoutubePlayerController.convertUrlToId(widget.topic.youtubeId) ?? widget.topic.youtubeId;
                    launchUrl(Uri.parse("https://www.youtube.com/watch?v=$videoId"), mode: LaunchMode.externalApplication);
                  },
                  icon: const Icon(Icons.open_in_new, size: 16),
                  label: const Text("Open Externally"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Watch this helpful conceptual walk directly in the slide to solidify key definitions and operations!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 11, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  // SLIDE 6-9: MCQ QUIZZES PANEL
  Widget _buildQuizSlide(int quizIndex, ThemeData theme) {
    if (quizIndex >= widget.topic.quizzes.length) {
      return const Center(child: Text("Quiz index out of range"));
    }
    final quiz = widget.topic.quizzes[quizIndex];
    final selectedIdx = _selectedAnswers[quizIndex];
    final showExpl = _showExplanations[quizIndex] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.indigo.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      quiz.type.toUpperCase(),
                      style: const TextStyle(color: Colors.purpleAccent, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text("Quiz: Free Navigation", style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
              const SizedBox(height: 14),
              // QUESTION
              Text(
                quiz.question,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
              ),
              const SizedBox(height: 16),

              // OPTIONS LISTING
              ...List.generate(quiz.options.length, (optIdx) {
                final isSelected = selectedIdx == optIdx;
                final isCorrect = optIdx == quiz.correctIndex;
                Color optBgColor = Colors.white.withOpacity(0.02);
                Color optBorderColor = Colors.white10;

                if (selectedIdx != null) {
                  if (isSelected) {
                    optBgColor = isCorrect ? Colors.green.withOpacity(0.12) : Colors.red.withOpacity(0.12);
                    optBorderColor = isCorrect ? Colors.green : Colors.red;
                  } else if (isCorrect && showExpl) {
                    optBgColor = Colors.green.withOpacity(0.04);
                    optBorderColor = Colors.green.withOpacity(0.5);
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: selectedIdx == null
                        ? () {
                            setState(() {
                              _selectedAnswers[quizIndex] = optIdx;
                              _showExplanations[quizIndex] = true;
                            });
                          }
                        : null,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: optBgColor,
                        border: Border.all(color: optBorderColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected ? optBorderColor : Colors.white12,
                            ),
                            child: Center(
                              child: Text(
                                String.fromCharCode(65 + optIdx),
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              quiz.options[optIdx],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey[200],
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              // EXPLANATION PANEL
              if (showExpl) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            selectedIdx == quiz.correctIndex ? Icons.check_circle : Icons.error_outline,
                            color: selectedIdx == quiz.correctIndex ? Colors.green : Colors.redAccent,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            selectedIdx == quiz.correctIndex ? "Correct Answer!" : "Incorrect Answer",
                            style: TextStyle(
                              color: selectedIdx == quiz.correctIndex ? Colors.green : Colors.redAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        quiz.explanation,
                        style: TextStyle(color: Colors.grey[400], fontSize: 11, height: 1.4),
                      ),
                    ],
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    ],
  );
}

  // SLIDE 10: RECAP SUMMARY & COURSE COMPLETION STATE SCREEN
  Widget _buildSummarySlide(ThemeData theme) {
    final summary = widget.topic.summary;
    return Column(
      children: [
        Card(
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.history_edu, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      summary.title.toUpperCase(),
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.amber),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...summary.keyTakeaways.map<Widget>((takeaway) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("• ", style: TextStyle(color: Colors.amber, fontSize: 16)),
                        Expanded(
                          child: Text(
                            takeaway,
                            style: TextStyle(color: Colors.grey[200], fontSize: 16, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // CONGRATS CERTIFICATE
        Card(
          color: const Color(0xFF1E1B4B),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Colors.indigoAccent)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.emoji_events, color: Colors.amberAccent, size: 36),
                const SizedBox(height: 8),
                const Text(
                  "CONGRATULATIONS!",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1),
                ),
                const SizedBox(height: 4),
                const Text(
                  "You have successfully navigated this scholastic presentation deck. Complete the exercises to claim your homework credits!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 11, height: 1.4),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("CLASSROOM ASSIGNMENT:", style: TextStyle(color: Color(0xFFA3E635), fontSize: 9, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(summary.classroomActivity, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.3)),
                      const SizedBox(height: 10),
                      const Text("DID YOU KNOW?", style: TextStyle(color: Colors.indigoAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(summary.quickFact, style: TextStyle(color: Colors.grey[200], fontSize: 14, height: 1.3)),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

// DRAW INCLINED TRIANGLES FOR RAMPS OR COORDINATE ROTATIONS
class InclinePainter extends CustomPainter {
  final double angleDegrees;
  final Color accentColor;

  InclinePainter({required this.angleDegrees, required this.accentColor});

  @override
  void paint(Canvas canvas, Size size) {
    final baseLinePaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final shapePaint = Paint()
      ..color = accentColor.withOpacity(0.12)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = accentColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final h = size.height;
    final w = size.width;

    // Base point bottom-left
    final origin = Offset(0, h);
    // Base point bottom-right
    final baseEdge = Offset(w, h);

    // Calculate vertical height based on tilt angle
    final rad = (angleDegrees * math.pi) / 180;
    final targetY = h - (w * math.sin(rad) * 0.7);
    final targetOffset = Offset(w, targetY);

    // Fill triangle path
    final path = Path()
      ..moveTo(origin.dx, origin.dy)
      ..lineTo(baseEdge.dx, baseEdge.dy)
      ..lineTo(targetOffset.dx, targetOffset.dy)
      ..close();

    canvas.drawPath(path, shapePaint);
    canvas.drawLine(origin, baseEdge, baseLinePaint);
    canvas.drawLine(origin, targetOffset, borderPaint);
    canvas.drawLine(baseEdge, targetOffset, baseLinePaint);
  }

  @override
  bool shouldRepaint(covariant InclinePainter oldDelegate) => oldDelegate.angleDegrees != angleDegrees;
}
