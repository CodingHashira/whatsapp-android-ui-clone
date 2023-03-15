import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/archived.dart';

import 'pages/archived_settings.dart';
import 'pages/launch.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
        cardColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LaunchPage(),
        '/archivedPage': (context) => const ArchivedPage(),
        '/archiveSettingsPage': (context) => const ArchiveSettingsPage(),
      },
      // home: const LaunchPage(),
    );
  }
}
