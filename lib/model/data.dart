import 'package:flutter/material.dart';

class Chat {
  const Chat({
    required this.imageUrl,
    this.imageStackIcon,
    required this.title,
    required this.time,
    required this.subTitle,
    this.trailingIcon,
  });

  final String imageUrl;
  final IconData? imageStackIcon;
  final String title;
  final String time;
  final String subTitle;
  final IconData? trailingIcon;
}

class Data {
  const Data();
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

  get conversaionList => _conversationList;

  static const Map<String, String> _archivedPopupMenuItems = {
    'Archive Settings': '/archiveSettingsPage',
  };

  get archivedPopupMenuItems => _archivedPopupMenuItems;

  static const Map<String, dynamic> _chatPopupMenuItems = {
    'View contact': '/testPage',
    'Media, links, and docs': '/testPage',
    'Search': '/testPage',
    'Mute notifications': '/testPage',
    'Disappearing messages': '/testPage',
    'Wallpaper': '/testPage',
    'More': morePopupMenuItems,
  };

  get chatPopupMenuItems => _chatPopupMenuItems;

  static const Map<String, String> morePopupMenuItems = {
    'Report': '1',
    'Block': '2',
    'Clear chat': '3',
    'Export chat': '4',
    'Add shortcut': '5',
  };

  static const List<Map<String, String>> _messageList = [
    {
      'sender': 'other',
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
      'text': 'I was thinking of staying for a week. What about you?',
    },
    {
      'sender': 'me',
      'text': 'A week sounds good to me. Have you looked into flights yet?',
    },
    {
      'sender': 'other',
      'text':
          'Yes, I have. There are a few options that are reasonably priced. Do you have any preferences?',
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

  get messageList => _messageList;

  static const List _settingsMenu = [
    {
      'leading': Icon(Icons.account_circle_rounded),
      'title': 'Account',
      'subTitle': 'Security notifications, change number',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.lock_rounded),
      'title': 'Privacy',
      'subTitle': 'Block contacts, disappearing messages',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.emoji_emotions_rounded),
      'title': 'Avatar',
      'subTitle': 'Create, edit, profile photo',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.chat_rounded),
      'title': 'Chats',
      'subTitle': 'Theme, wallpapers, chat history',
      'pageRoute': '/testPage'
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
      'pageRoute': '/testPage',
    },
  ];

  get settingsMenu => _settingsMenu;

  static const List _accountMenu = [
    {
      'leading': Icon(Icons.security_rounded),
      'title': 'Security notifications',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.screen_lock_portrait_rounded),
      'title': 'Two-step verification',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.send_to_mobile_rounded),
      'title': 'Change number',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.description_rounded),
      'title': 'Request account info',
      'pageRoute': '/testPage'
    },
    {
      'leading': Icon(Icons.delete_rounded),
      'title': 'Delete my account',
      'pageRoute': '/testPage'
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
      'title': 'Disappearing messages',
      'subTitle': 'Default message timer, Apply timer to chats',
      'pageRoute': '/disappearingMessagesPage'
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
}
