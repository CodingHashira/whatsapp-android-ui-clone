import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_flutter_whatsapp/pages/settings.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/account_page/change_number.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/account_page/delete_account.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/account_page/request_account_info.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/account_page/security_notifications.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/account_page/two_step_auth.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/archived.dart';
import 'package:ui_flutter_whatsapp/pages/testp.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/about.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/blocked_contacts.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/default_message_timer.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/disappering_messages.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/fingerprint_lock.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/groups.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/last_seen_online.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/live_location.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/profile_photo.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/status_privacy.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/account.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/avatar.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/chats.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/chats_page/chat_history.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/chats_page/theme_wallpaper.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/invite_friend.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy.dart';

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
      initialRoute: '/applyChatTimer',
      routes: {
        '/': (context) => const LaunchPage(),
        '/archivedPage': (context) => const ArchivedPage(),
        '/archiveSettingsPage': (context) => const ArchiveSettingsPage(),
        '/chatScreen': (context) => const ChatScreen(),
        '/testPage': (context) => const TestpPage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/accountPage': (context) => const AccountPage(),
        '/privacyPage': (context) => const PrivacyPage(),
        '/lastseenOnlinePage': (context) => const LastSeenOnlinePage(),
        '/profilePhotoPage': (context) => const ProfilePhotoPage(),
        '/aboutPage': (context) => const AboutPage(),
        '/statusPrivacyPage': (context) => const StatusPrivacyPage(),
        '/groupsPage': (context) => const GroupsPage(),
        '/fingerprintLockPage': (context) => const FingerprintLockPage(),
        '/blockedContactsPage': (context) => const BlockedContactsPage(),
        '/liveLocationPage': (context) => const LiveLocationPage(),
        '/twoStepAuthPage': (context) => const TwoStepAuthPage(),
        '/changeNumberPage': (context) => const ChangeNumberPage(),
        '/requestAccountInfoPage': (context) => const RequestAccountInfoPage(),
        '/deleteAccountPage': (context) => const DeleteAccountPage(),
        '/avatarPage': (context) => const AvatarPage(),
        '/chatsPage': (context) => const ChatsPage(),
        '/inviteFriendPage': (context) => const InviteFriendPage(),
        '/chatHistoryPage': (context) => const ChatHistoryPage(),
        '/themeWallpaperPage': (context) => const ThemeWallpaperPage(),
        '/deafultMessageTimerPage': (context) =>
            const DeafultMessageTimerPage(),
        '/securityNotificationsPage': (context) =>
            const SecurityNotificationsPage(),
        '/disappearingMessagesPage': (context) =>
            const DisappearingMessagesPage(),
      },
    );
  }
}
