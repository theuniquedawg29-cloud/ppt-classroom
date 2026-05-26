import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/dashboard_screen.dart';
import 'models/ppt_models.dart';
import 'vigyaan_agent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VigyaanAgent()),
      ],
      child: const InteractivePPTApp(),
    ),
  );
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
