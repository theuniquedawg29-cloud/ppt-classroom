import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'models/ppt_models.dart';

void main() {
  runApp(const InteractivePPTApp());
}

class InteractivePPTApp extends StatelessWidget {
  const InteractivePPTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: appThemeNotifier,
      builder: (context, themeId, child) {
        final themeData = PPTThemeHelper.getThemeData(themeId);
        return MaterialApp(
          title: 'Interactive PPT Classroom',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: themeData,
          darkTheme: themeData,
          home: const DashboardScreen(),
        );
      },
    );
  }
}
