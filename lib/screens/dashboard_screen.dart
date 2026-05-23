import 'dart:convert';
import 'package:flutter/material.dart';
import '../data/slides_database_json.dart';
import '../models/ppt_models.dart';
import 'slide_player_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<dynamic> _classesData;
  Map<String, dynamic>? _selectedClass;
  Map<String, dynamic>? _selectedSubject;
  Map<String, dynamic>? _selectedChapter;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _classesData = json.decode(SlidesDatabaseJson.databaseRawJson);
    // Auto-select the first class and subject
    if (_classesData.isNotEmpty) {
      _selectedClass = _classesData[0];
      final subjects = _selectedClass!['subjects'] as List;
      if (subjects.isNotEmpty) {
        _selectedSubject = subjects[0];
        final chapters = _selectedSubject!['chapters'] as List;
        if (chapters.isNotEmpty) {
          _selectedChapter = chapters[0];
        }
      }
    }
  }

  void _onClassSelected(Map<String, dynamic> cls) {
    setState(() {
      _selectedClass = cls;
      final subjects = cls['subjects'] as List;
      _selectedSubject = subjects.isNotEmpty ? subjects[0] : null;
      if (_selectedSubject != null) {
        final chapters = _selectedSubject!['chapters'] as List;
        _selectedChapter = chapters.isNotEmpty ? chapters[0] : null;
      } else {
        _selectedChapter = null;
      }
    });
  }

  void _onSubjectSelected(Map<String, dynamic> sub) {
    setState(() {
      _selectedSubject = sub;
      final chapters = sub['chapters'] as List;
      _selectedChapter = chapters.isNotEmpty ? chapters[0] : null;
    });
  }

  void _onChapterSelected(Map<String, dynamic> chap) {
    setState(() {
      _selectedChapter = chap;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chaptersList = _selectedSubject != null ? (_selectedSubject!['chapters'] as List) : [];
    final topicsList = _selectedChapter != null ? (_selectedChapter!['topics'] as List) : [];

    // Filter topics if search query is active
    final filteredTopics = topicsList.where((topic) {
      final title = (topic['title'] ?? '').toString().toLowerCase();
      final desc = (topic['description'] ?? '').toString().toLowerCase();
      return title.contains(_searchQuery.toLowerCase()) || desc.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Interactive PPT Studio",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "Developed by Santosh TechWorks",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.indigoAccent),
            onPressed: () {
              setState(() {
                _searchQuery = "";
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADING PANEL
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    Theme.of(context).colorScheme.surface,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "DEVELOPED BY SANTOSH TECHWORKS",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "High Fidelity Class Lessons",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.5),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Switch grades, chapters and slide datasets. Render animations, live numerical simulations, and classroom MCQs with zero API costs.",
                    style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // GLOBAL APP THEME SELECTOR
            const Text(
              "Global App & PPT Theme",
              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: PPTThemeHelper.availableThemes.map((themeId) {
                  final isSelected = appThemeNotifier.value == themeId;
                  final themeData = PPTThemeHelper.getThemeData(themeId);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        themeId.replaceAll('-', ' ').toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.black : Colors.white,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: themeData.colorScheme.primary,
                      backgroundColor: Colors.white.withOpacity(0.05),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            appThemeNotifier.value = themeId;
                          });
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),

            // GRADE SELECTION
            const Text(
              "Select Class Grade",
              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _classesData.length,
                itemBuilder: (context, index) {
                  final cls = _classesData[index];
                  final isSelected = _selectedClass?['id'] == cls['id'];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () => _onClassSelected(cls),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF1E1B4B) : const Color(0xFF18181C),
                          border: Border.all(
                            color: isSelected ? Colors.indigoAccent : Colors.grey.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [BoxShadow(color: Colors.indigo.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]
                              : null,
                        ),
                        child: Text(
                          cls['name'] ?? '',
                          style: TextStyle(
                            color: isSelected ? Colors.indigoAccent : Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // SUBJECT SELECTION
            if (_selectedClass != null) ...[
              const Text(
                "Select Subject Track",
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: (_selectedClass!['subjects'] as List).map<Widget>((sub) {
                    final isSelected = _selectedSubject?['id'] == sub['id'];
                    final isMath = sub['id'] == 'math';
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: InkWell(
                        onTap: () => _onSubjectSelected(sub),
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 180,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF1E1B4B) : const Color(0xFF121216),
                            border: Border.all(
                              color: isSelected ? Colors.indigoAccent : Colors.grey.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isMath ? Icons.calculate : Icons.science,
                                color: isSelected ? Colors.indigoAccent : Colors.grey,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      sub['name'] ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: isSelected ? Colors.white : Colors.grey[300],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "${(sub['chapters'] as List).length} chapters",
                                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 24),

            // CHAPTER LISTINGS
            if (_selectedSubject != null && chaptersList.isNotEmpty) ...[
              const Text(
                "Course Chapters Directory",
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: chaptersList.map<Widget>((chap) {
                  final isSelected = _selectedChapter?['id'] == chap['id'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () => _onChapterSelected(chap),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF13131A) : const Color(0xFF0C0C0F),
                          border: Border.all(
                            color: isSelected ? Colors.indigoAccent.withOpacity(0.5) : Colors.grey.withOpacity(0.05),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.indigo.withOpacity(0.2) : Colors.grey.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.bookmark_added,
                                color: isSelected ? Colors.indigoAccent : Colors.grey,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          chap['name'] ?? '',
                                          style: TextStyle(
                                            color: isSelected ? Colors.indigoAccent : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      if ((chap['topics'] as List).isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.green.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(4),
                                            border: Border.all(color: Colors.green.withOpacity(0.3)),
                                          ),
                                          child: Text(
                                            "${(chap['topics'] as List).length} TOPICS",
                                            style: const TextStyle(color: Colors.greenAccent, fontSize: 8, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    chap['description'] ?? '',
                                    style: TextStyle(color: Colors.grey[400], fontSize: 11, height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 24),

            // PRESENTATIONS SECTION
            if (_selectedChapter != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dynamic Slide Presentations",
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${filteredTopics.length} lectures loaded",
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Search field
              TextField(
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                style: const TextStyle(color: Colors.white, fontSize: 12),
                decoration: InputDecoration(
                  hintText: "Search presentation topics...",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 18),
                  filled: true,
                  fillColor: const Color(0xFF141419),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
              const SizedBox(height: 12),

              if (filteredTopics.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text("No matched topics found inside this chapter.", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredTopics.length,
                  itemBuilder: (context, index) {
                    final t = filteredTopics[index];
                    return Card(
                      color: const Color(0xFF0F0F13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(0.1)),
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () => _showLayoutSelection(context, t),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t['title'] ?? '',
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      t['description'] ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.grey[400], fontSize: 11, height: 1.4),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                                      ),
                                      child: Text(
                                        "Interactive PPT Lesson",
                                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 8, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.play_arrow_rounded, color: Theme.of(context).colorScheme.primary, size: 28),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ],
        ),
      ),
    );
  }

  void _showLayoutSelection(BuildContext context, Map<String, dynamic> topicData) {
    final layouts = [
      {'id': 'standard', 'name': 'Standard Flow', 'icon': Icons.view_stream, 'desc': 'Classic top-to-bottom academic view'},
      {'id': 'split-left', 'name': 'Creative Split (L)', 'icon': Icons.view_quilt, 'desc': 'Visuals on left, content on right'},
      {'id': 'split-right', 'name': 'Creative Split (R)', 'icon': Icons.view_sidebar, 'desc': 'Content on left, visuals on right'},
      {'id': 'focus-media', 'name': 'Immersive Media', 'icon': Icons.filter_frames, 'desc': 'Maximize diagrams and interactions'},
      {'id': 'modern-grid', 'name': 'Professional Grid', 'icon': Icons.grid_view, 'desc': 'Side-by-side executive dashboard look'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111827),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose Presentation Layout",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Select how you want to visualize this scholastic deck",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: layouts.length,
                  itemBuilder: (context, index) {
                    final l = layouts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          final topicModel = PPTTopic.fromJson(topicData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SlidePlayerScreen(
                                topic: topicModel,
                                preferredLayout: l['id'] as String,
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(l['icon'] as IconData, color: Theme.of(context).colorScheme.primary, size: 20),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(l['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                                    Text(l['desc'] as String, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
