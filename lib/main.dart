import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_flutter_whatsapp/pages/settings.dart';
import 'package:ui_flutter_whatsapp/widgets/chat_page/chat_screen.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/archived.dart';
import 'package:ui_flutter_whatsapp/pages/testp.dart';
import 'package:ui_flutter_whatsapp/widgets/settings_page/account.dart';
import 'package:ui_flutter_whatsapp/widgets/settings_page/privacy.dart';

import 'pages/archive_settings.dart';
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
      theme: kThemeData,
      initialRoute: '/archivedPage',
      routes: {
        '/': (context) => const LaunchPage(),
        '/archivedPage': (context) => const ArchivedPage(),
        '/archiveSettingsPage': (context) => const ArchiveSettingsPage(),
        '/chatScreen': (context) => const ChatScreen(),
        '/testPage': (context) => const TestpPage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/accountPage': (context) => const AccountPage(),
        '/privacyPage': (context) => const PrivacyPage(),
      },
    );
  }
}
