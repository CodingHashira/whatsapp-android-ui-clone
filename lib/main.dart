import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants.dart';
import './pages/testp.dart';
import './pages/launch.dart';
import './pages/settings.dart';
import './pages/archived.dart';
import './pages/archive_settings.dart';
import './pages/conversation_page.dart';
import './pages/settings_page/chats.dart';
import './pages/settings_page/avatar.dart';
import './pages/settings_page/profile.dart';
import './pages/settings_page/account.dart';
import './pages/settings_page/privacy.dart';
import 'pages/settings_page/notifications.dart';
import './pages/settings_page/invite_friend.dart';
import 'pages/settings_page/help_page/app_info.dart';
import './pages/settings_page/privacy_page/about.dart';
import './pages/settings_page/privacy_page/groups.dart';
import './pages/settings_page/help_page/contact_us.dart';
import './pages/settings_page/chats_page/chat_history.dart';
import 'pages/settings_page/account_page/choose_country.dart';
import './pages/settings_page/account_page/change_number.dart';
import './pages/settings_page/account_page/two_step_auth.dart';
import './pages/settings_page/privacy_page/live_location.dart';
import './pages/settings_page/privacy_page/profile_photo.dart';
import './pages/settings_page/chats_page/theme_wallpaper.dart';
import './pages/settings_page/privacy_page/status_privacy.dart';
import './pages/settings_page/account_page/delete_account.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/help.dart';
import './pages/settings_page/privacy_page/blocked_contacts.dart';
import './pages/settings_page/privacy_page/fingerprint_lock.dart';
import './pages/settings_page/privacy_page/last_seen_online.dart';
import './pages/settings_page/privacy_page/disappering_messages.dart';
import './pages/settings_page/account_page/request_account_info.dart';
import './pages/settings_page/privacy_page/default_message_timer.dart';
import './pages/settings_page/account_page/security_notifications.dart';

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
      // initialRoute: '/chooseCountry',
      initialRoute: '/deleteAccountPage',
      routes: {
        '/': (context) => const LaunchPage(),
        '/helpPage': (context) => const HelpPage(),
        '/testPage': (context) => const TestpPage(),
        '/chatsPage': (context) => const ChatsPage(),
        '/aboutPage': (context) => const AboutPage(),
        '/appInfoPage': (context) => const AppInfoPage(),
        '/launchPage': (context) => const LaunchPage(),
        '/groupsPage': (context) => const GroupsPage(),
        '/avatarPage': (context) => const AvatarPage(),
        '/accountPage': (context) => const AccountPage(),
        '/privacyPage': (context) => const PrivacyPage(),
        '/profilePage': (context) => const ProfilePage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/contactUsPage': (context) => const ContactUsPage(),
        '/archivedPage': (context) => const ArchivedPage(),
        '/chooseCountry': (context) => const ChooseCountry(),
        '/chatHistoryPage': (context) => const ChatHistoryPage(),
        '/twoStepAuthPage': (context) => const TwoStepAuthPage(),
        '/conversationPage': (context) => const ConversationPage(),
        '/changeNumberPage': (context) => const ChangeNumberPage(),
        '/notificationsPage': (context) => const NotificationsPage(),
        '/inviteFriendPage': (context) => const InviteFriendPage(),
        '/liveLocationPage': (context) => const LiveLocationPage(),
        '/profilePhotoPage': (context) => const ProfilePhotoPage(),
        '/deleteAccountPage': (context) => const DeleteAccountPage(),
        '/statusPrivacyPage': (context) => const StatusPrivacyPage(),
        '/themeWallpaperPage': (context) => const ThemeWallpaperPage(),
        '/lastseenOnlinePage': (context) => const LastSeenOnlinePage(),
        '/archiveSettingsPage': (context) => const ArchiveSettingsPage(),
        '/fingerprintLockPage': (context) => const FingerprintLockPage(),
        '/blockedContactsPage': (context) => const BlockedContactsPage(),
        '/requestAccountInfoPage': (context) => const RequestAccountInfoPage(),
        '/deafultMessageTimerPage': (context) =>
            const DeafultMessageTimerPage(),
        '/disappearingMessagesPage': (context) =>
            const DisappearingMessagesPage(),
        '/securityNotificationsPage': (context) =>
            const SecurityNotificationsPage(),
      },
    );
  }
}
