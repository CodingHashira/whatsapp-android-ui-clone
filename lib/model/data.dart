import 'package:flutter/material.dart';

class Chat {
  Chat({
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
  final archiveInfo =
      'These chats stay archived when new messages are received. Tap to change';

  final List<Chat> conversationList = [
    Chat(
        imageUrl: 'images/g1.jpg',
        title: 'F.R.I.E.N.D.S 🙈',
        time: '2/02/23',
        subTitle: 'Joey : I\'m not even sorry'),
    Chat(
        imageUrl: 'images/p1.jpg',
        title: 'Joey',
        time: '2/02/23',
        subTitle: 'How you doin?'),
    Chat(
      imageUrl: 'images/p2.jpg',
      title: 'Rachael',
      time: '2/02/23',
      subTitle: 'Can you believe what happened today?',
    ),
    Chat(
        imageUrl: 'images/p3.jpg',
        title: 'Monica ',
        time: '2/02/23',
        subTitle: 'Tomorrow?'),
    Chat(
        imageUrl: 'images/p4.jpg',
        title: 'Ross',
        time: '2/02/23',
        subTitle: 'I\'m really excited about our plans this weekend!'),
  ];

  final Map<String, String> popUpList = {
    'Archive Settings': '/archiveSettingsPage',
    'Archives Settings': '/archiveSettingsPage',
    'Archivess Settings': '/archiveSettingsPage'
  };

  final Map chatPopupMenuItems = {
    'View contact': '/testPage',
    'Media, links, and docs': '/testPage',
    'Search': '/testPage',
    'Mute notifications': '/testPage',
    'Disappearing messages': '/testPage',
    'Wallpaper': '/testPage',
    'More': morePopupMenuItems,
  };

  static const Map<String, String> morePopupMenuItems = {
    'Report': '1',
    'Block': '2',
    'Clear chat': '3',
    'Export chat': '4',
    'Add shortcut': '5',
  };
}
