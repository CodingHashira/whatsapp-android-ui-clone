import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/alert_dialogs/chat_backup.dart';
import 'package:ui_flutter_whatsapp/alert_dialogs/select_theme.dart';

class Chat {
  const Chat({
    required this.imageUrl,
    this.imageStackIcon,
    required this.title,
    this.time,
    required this.subTitle,
    this.trailingIcon,
  });

  final String imageUrl;
  final IconData? imageStackIcon;
  final String title;
  final String? time;
  final String subTitle;
  final IconData? trailingIcon;
}

class Data {
  const Data();

  static final Size _size =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  get size => _size;

  final archiveInfo =
      'These chats stay archived when new messages are received. Tap to change';

  static const List<Chat> _conversationList = [
    Chat(
      imageUrl: 'images/g1.jpg',
      title: 'F.R.I.E.N.D.S 🙈',
      time: 'Yesterday',
      subTitle: 'Joey : I\'m not even sorry',
    ),
    Chat(
      imageUrl: 'images/p1.jpg',
      title: 'Joey',
      time: '2/02/23',
      subTitle: 'How you doin?',
    ),
    Chat(
      imageUrl: 'images/p2.jpg',
      title: 'Rachael',
      time: '3/16/23',
      subTitle: 'Can you believe what happened today?',
    ),
    Chat(
      imageUrl: 'images/p3.jpg',
      title: 'Monica ',
      time: '22:34',
      subTitle: 'Tomorrow?',
    ),
    Chat(
      imageUrl: 'images/p4.jpg',
      title: 'Ross',
      time: 'Yesterday',
      subTitle: 'Ah. Humor Based On My Pain.',
    ),
  ];

  List<Chat> get conversaionList => _conversationList;

  static const List<Chat> _inviteFriendList = [
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Janice Litman-Goralnik',
      subTitle: '+91 9462736619',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Gunther',
      subTitle: '+91 8386772630',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Gavin Mitchell',
      subTitle: '+91 8893552671',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Paolo',
      subTitle: '+91 7388930166',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Charlie Wheeler',
      subTitle: '+91 637758391',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Tag Jones',
      subTitle: '+91 9476628842',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Eddie Menuek',
      subTitle: '+91 9947728462',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Barry Farber',
      subTitle: '+91 883726539, +91 9687653321',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Amy Green',
      subTitle: '+91 8277382946',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Paul Stevens',
      subTitle: '+91 7534576288',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'David',
      subTitle: '+91 9883745663',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Pete Becker',
      subTitle: '+91 99472656482',
    ),
    Chat(
      imageUrl: 'images/no_profile.jpg',
      title: 'Elizabeth Stevens',
      subTitle: '+91 89938827488',
    ),
  ];

  List<Chat> get inviteFriendList => _inviteFriendList;

  static const Map<String, List> _textData = {
    'securityNotifications': [
      'End-to-end encryption keeps your personal messages and calls between you and the people you choose. Not even WhatsApp can read or listen to them. This includes your:',
      'Get notified when your security code changes for a contact\'s phone in an end-to-end encrypted chat. If you have multiple devices, this setting must be enabled on each device where you want to get notifications.',
    ],
    'twoStepAuth': [
      'For extra security, turn on two-step verification, which will require a PIN when registering your phone number with WhatsApp again.',
    ],
    'changeNumber': [
      'Changing your phone number will migrate your account info, groups & settings.',
      'Before proceeding, please confirm that you are able to receive SMS or calls at your new number.',
      'If you have both a new phone & a new number, first change your number on your Old phone.',
    ],
    'requestAccountInfo': [
      'Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages.',
      'Your report will be ready in about 3 days. You\'ll have a few weeks to download your report after it\'s available.',
      'Your request will be canceled if you make changes to your account such as changing your number or deleting your account.',
    ],
    'deleteAccount': [
      'To delete your account, confirm your country code and enter your phone number.',
    ],
    'readReceiptSwitch': [
      'If turned Off, you won\'t send or receive Read receipts. Read receipts are always sent for group chats.',
    ],
    'fingerPrintLock': [
      'When enabled, you\'ll need to use fingerprint to open WhatsApp. You can still answer calls if WhatsApp is locked.',
    ],
    'groups': [
      'Admins who can\'t add you to a group chat will have the option of inviting you privately instead.',
    ],
    'statusPrivacy': [
      'Changes to your privacy settings wont affect status updates that you\'ve sent already',
    ],
    'themeWallpaper': [
      'To change your wallpaper for light theme, turn on light theme from Settings > Chats > Theme.',
    ],
    'defaultMessageTimer': [
      'When turned on, all new individual chats will start with disappearing messages set to the duration you select. This setting will not affect your existing chats.',
    ],
    'lastSeenOnline': [
      ', you won\'t be able to see other people\'s last seen and online.'
    ],
  };

  Map<String, List> get textData => _textData;

// TODO remove
  static const List<String> _textData3 = [
    'For added privacy, new messages will disappear for everyone from the chat after the duration you select. Chat participants will see you turned this on.',
  ];

  static const Map<String, String> _archivedPopupMenuItems = {
    'Archive Settings': '/archiveSettingsPage',
  };

  Map<String, String> get archivedPopupMenuItems => _archivedPopupMenuItems;

  static const Map<String, dynamic> _chatPopupMenuItems = {
    'View contact': '/testPage',
    'Media, links, and docs': '/testPage',
    'Search': '/testPage',
    'Mute notifications': '/testPage',
    'Disappearing messages': '/testPage',
    'Wallpaper': '/testPage',
    'More': morePopupMenuItems,
  };

  Map<String, dynamic> get chatPopupMenuItems => _chatPopupMenuItems;

  static const Map<String, String> morePopupMenuItems = {
    'Report': '1',
    'Block': '2',
    'Clear chat': '3',
    'Export chat': '4',
    'Add shortcut': '5',
  };

  static const List<Map<String, Object>> _messageList = [
    {
      'sender': 'other',
      'text': 'Hey',
    },
    {
      'sender': 'me',
      'text': 'Hey',
    },
    {
      'sender': 'other',
      'text':
          'I was thinking of planning a trip to Hawaii. Would you like to join me?',
    },
    {
      'sender': 'me',
      'text': 'That sounds great! When are you thinking of going? ',
    },
    {
      'sender': 'other',
      'text': 'I was thinking of going in June. What do you think?',
    },
    {
      'sender': 'me',
      'text': 'June works for me. How long are you planning on staying?',
    },
    {
      'sender': 'other',
      'text': 'I was thinking of staying for a week',
    },
    {
      'sender': 'other',
      'text':
          'There are a few options that are reasonably priced. Do you have any preferences?',
    },
    {
      'sender': 'me',
      'text': 'Not really. I trust your judgment. What about accommodations?',
    },
    {
      'sender': 'other',
      'text':
          'I was thinking of renting a condo near the beach. It’\'s more affordable than staying at a hotel. And ou also like such condo you said',
    },
    {
      'sender': 'me',
      'text':
          'That sounds like a good idea. Do you need any help with planning?',
    },
    {
      'sender': 'other',
      'text':
          'Actually, that would be great. I could use some help with planning activities and excursions.',
    },
    {
      'sender': 'me',
      'text': 'Sure, I\'d be happy to help. Let\'s plan a fun trip!',
    },
  ];

  List<Map<String, Object>> get messageList => _messageList;

  static const List _settingsMenu = [
    {
      'leading': Icon(Icons.account_circle_rounded),
      'title': 'Account',
      'subTitle': 'Security notifications, change number',
      'pageRoute': '/accountPage'
    },
    {
      'leading': Icon(Icons.lock_rounded),
      'title': 'Privacy',
      'subTitle': 'Block contacts, disappearing messages',
      'pageRoute': '/privacyPage'
    },
    {
      'leading': Icon(Icons.emoji_emotions_rounded),
      'title': 'Avatar',
      'subTitle': 'Create, edit, profile photo',
      'pageRoute': '/avatarPage'
    },
    {
      'leading': Icon(Icons.chat_rounded),
      'title': 'Chats',
      'subTitle': 'Theme, wallpapers, chat history',
      'pageRoute': '/chatsPage'
    },
    {
      'leading': Icon(Icons.notifications_rounded),
      'title': 'Notifications',
      'subTitle': 'Message, group & call tones',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.storage_rounded),
      'title': 'Storage and data',
      'subTitle': 'Network usage, auto-download',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.language_rounded),
      'title': 'App language',
      'subTitle': 'English (phone\'s language)',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.help_outline),
      'title': 'Help',
      'subTitle': 'Help center, contact us, privacy policy',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.group),
      'title': 'Invite a friend',
      'pageRoute': '/inviteFriendPage',
    },
  ];

  get settingsMenu => _settingsMenu;

  static const List _accountMenu = [
    {
      'leading': Icon(Icons.security_rounded),
      'title': 'Security notifications',
      'pageRoute': '/securityNotificationsPage'
    },
    {
      'leading': Icon(Icons.screen_lock_portrait_rounded),
      'title': 'Two-step verification',
      'pageRoute': '/twoStepAuthPage'
    },
    {
      'leading': Icon(Icons.send_to_mobile_rounded),
      'title': 'Change number',
      'pageRoute': '/changeNumberPage'
    },
    {
      'leading': Icon(Icons.description_rounded),
      'title': 'Request account info',
      'pageRoute': '/requestAccountInfoPage'
    },
    {
      'leading': Icon(Icons.delete_rounded),
      'title': 'Delete my account',
      'pageRoute': '/deleteAccountPage'
    },
  ];

  get accountMenu => _accountMenu;

  static const List _privacyMenu = [
    {
      'title': 'Last seen and online',
      'subTitle': 'Nobody',
      'pageRoute': '/lastseenOnlinePage'
    },
    {
      'title': 'Profile photo',
      'subTitle': 'My contacts',
      'pageRoute': '/profilePhotoPage'
    },
    {
      'title': 'About',
      'subTitle': 'My contacts',
      'pageRoute': '/aboutPage',
    },
    {
      'title': 'Status',
      'subTitle': '404 contacts excluded',
      'pageRoute': '/statusPrivacyPage'
    },
    {
      'title': 'Groups',
      'subTitle': '404 contacts excluded',
      'pageRoute': '/groupsPage'
    },
    {
      'title': 'Live location',
      'subTitle': 'None',
      'pageRoute': '/liveLocationPage',
    },
    {
      'title': 'Blocked contacts',
      'subTitle': '1',
      'pageRoute': '/blockedContactsPage',
    },
    {
      'title': 'Fingerprint lock',
      'subTitle': 'Disabled',
      'pageRoute': '/fingerprintLockPage'
    },
  ];

  get privacyMenu => _privacyMenu;

  static const List<String> _genericPrivacyRadioList = [
    'Everyone',
    'My contacts',
    'My contacts except...',
    'Nobody'
  ];

  get genericPrivacyRadioList => _genericPrivacyRadioList;

  static const List _securityNotificationsInfoList = [
    {
      'leading': Icon(
        Icons.chat_outlined,
        size: 20.0,
      ),
      'title': 'Text and voice messages',
    },
    {
      'leading': Icon(
        Icons.call_rounded,
        size: 20.0,
      ),
      'title': 'Audio and video calls',
    },
    {
      'leading': Icon(
        Icons.attachment_rounded,
        size: 20.0,
      ),
      'title': 'Photos, videos and documents',
    },
    {
      'leading': Icon(
        Icons.location_on,
        size: 20.0,
      ),
      'title': 'Location sharing',
    },
    {
      'leading': Icon(
        Icons.offline_bolt_outlined,
        size: 20.0,
      ),
      'title': 'Status updates',
    },
  ];

  get securityNotificationsInfoList => _securityNotificationsInfoList;

  static const List<String> _delAccountInfoList = [
    '• Delete your account from WhatsApp',
    '• Erase your message history',
    '• Delete you from all of your WhatsApp groups',
    '• Delete your Google Drive backup',
    '• Delete your payments info',
  ];

  get delAccountInfoList => _delAccountInfoList;

  static const List<Map<String, Object>> _countryCodesList = [
    {
      'icon': '\ud83c\uddfa\ud83c\uddf8',
      'code': '+1',
      'name': 'United States',
    },
    {
      'icon': '\ud83c\uddec\ud83c\udde7',
      'code': '+44',
      'name': 'United Kingdom'
    },
    {
      'icon': '\ud83c\udde8\ud83c\udde6',
      'code': '+1',
      'name': 'Canada',
    },
    {
      'icon': '\ud83c\udde6\ud83c\uddfa',
      'code': '+61',
      'name': 'Australia',
    },
    {
      'icon': '\ud83c\uddee\ud83c\uddea',
      'code': '+353',
      'name': 'Ireland',
    },
    {
      'icon': '\ud83c\uddfa\ud83c\uddff',
      'code': '+64',
      'name': 'New Zealand',
    },
    {
      'icon': '\ud83c\udded\ud83c\uddf2',
      'code': '+52',
      'name': 'Mexico',
    },
    {
      'icon': '\ud83c\uddef\ud83c\uddf5',
      'code': '+81',
      'name': 'Japan',
    },
    {
      'icon': '\ud83c\udde7\ud83c\uddf7',
      'code': '+55',
      'name': 'Brazil',
    },
    {
      'icon': '\ud83c\uddeb\ud83c\uddf7',
      'code': '+33',
      'name': 'France',
    },
    {
      'icon': '\ud83c\udde8\ud83c\uddf3',
      'code': '+86',
      'name': 'China',
    },
    {
      'icon': '\ud83c\udde9\ud83c\uddea',
      'code': '+49',
      'name': 'Germany',
    },
    {
      'icon': '\ud83c\uddee\ud83c\uddf3',
      'code': '+91',
      'name': 'India',
    },
    {
      'icon': '\ud83c\uddea\ud83c\uddf8',
      'code': '+34',
      'name': 'Spain',
    },
    {
      'icon': '\ud83c\udde6\ud83c\uddea',
      'code': '+971',
      'name': 'United Arab Emirates'
    },
    {
      'icon': '\ud83c\uddff\ud83c\uddf2',
      'code': '+27',
      'name': 'South Africa',
    },
    {
      'icon': '\ud83c\uddf8\ud83c\udde6',
      'code': '+966',
      'name': 'Saudi Arabia'
    },
    {
      'icon': '\ud83c\uddf0\ud83c\uddf7',
      'code': '+82',
      'name': 'South Korea',
    },
    {
      'icon': '\ud83c\uddf3\ud83c\uddec',
      'code': '+234',
      'name': 'Nigeria',
    }
  ];

  List<Map<String, Object>> get countryCodesList => _countryCodesList;

  static const List<String> _deafultMessageTimerList = [
    '24 hours',
    '7 days',
    '90 days',
    'Off',
  ];

  List<String> get deafultMessageTimerList => _deafultMessageTimerList;

  static const List<Map<String, Object>> _chatOptions = [
    {
      'leading': Icon(Icons.brightness_6_rounded),
      'title': 'Theme',
      'subTitle': 'System default',
      'dialogWidget': SelectThemeDialog(),
    },
    {
      'leading': Icon(Icons.wallpaper_rounded),
      'title': 'Wallpaper',
      'pageRoute': '/themeWallpaperPage',
    },
    {
      'leading': Icon(Icons.cloud_upload_rounded),
      'title': 'Chat backup',
      'dialogWidget': ChatBackupDialog(),
    },
    {
      'leading': Icon(Icons.history_rounded),
      'title': 'Chat history',
      'pageRoute': '/chatHistoryPage',
    },
  ];

  List<Map<String, Object>> get chatOptions => _chatOptions;

  static const List<Map<String, Object>> _chatSettings = [
    {
      'title': 'Enter is send',
      'subTitle': 'Enter key will send your message',
      'trailing': CustomSwitch(),
    },
    {
      'title': 'Media visibility',
      'subTitle': 'Show newly downloaded media in your device\'s gallery',
      'trailing': CustomSwitch(),
    },
    {
      'title': 'Font size',
      'subTitle': 'Small',
      'dialogRoute': '/SelectThemeDialog',
    },
  ];

  List<Map<String, Object>> get chatSettings => _chatSettings;

  static const List<Map<String, Object>> _chatHistoryOptionsList = [
    {
      'leading': Icon(Icons.file_upload_outlined),
      'title': 'Export chat',
    },
    {
      'leading': Icon(Icons.archive_rounded),
      'title': 'Archive all chats',
    },
    {
      'leading': Icon(Icons.do_not_disturb_on_outlined),
      'title': 'Clear all chats',
    },
    {
      'leading': Icon(Icons.delete_rounded),
      'title': 'Delete all chats',
    },
  ];

  List<Map<String, Object>> get chatHistoryOptionsList =>
      _chatHistoryOptionsList;

  static const List _themeDialogOptions = [
    'System Default',
    'Light',
    'Dark',
  ];

  get themeDialogOptions => _themeDialogOptions;

  static const List<String> _chatBackupDialogOptions = [
    'Never',
    'Only when I tap "Back up"',
    'Daily',
    'Weekly',
    'Monthly',
  ];

  List<String> get chatBackupDialogOptions => _chatBackupDialogOptions;

  static const List<String> _lastSeenRadioList = [
    'Everyone',
    'My contacts',
    'My contacts except...',
    'Nobody'
  ];

  List<String> get lastSeenRadioList => _lastSeenRadioList;

  static const List<String> _onlineIndicationRadioList = [
    'Everyone',
    'Same as last seen',
  ];

  List<String> get onlineIndicationRadioList => _onlineIndicationRadioList;
}
