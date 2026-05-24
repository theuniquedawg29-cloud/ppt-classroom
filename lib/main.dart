import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'screens/dashboard_screen.dart';
import 'models/ppt_models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (!Platform.isAndroid && !Platform.isIOS) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 800),
      minimumSize: Size(1000, 700),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "Interactive PPT Studio - TechWorks",
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const InteractivePPTApp());
}

class InteractivePPTApp extends StatelessWidget {
  const InteractivePPTApp({super.key});

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
