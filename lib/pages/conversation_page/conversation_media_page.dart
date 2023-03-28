import 'package:flutter/material.dart';

import './conversation_media/media.dart';
import './conversation_media/links.dart';
import './conversation_media/docs.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/widgets/conversation_page/tab.dart';

class ConversationMediaPage extends StatelessWidget {
  const ConversationMediaPage({
    super.key,
    required this.userName,
  });

  static const List<Widget> myTabs = [
    MyTab(
      title: 'MEDIA',
    ),
    MyTab(
      title: 'DOCS',
    ),
    MyTab(
      title: 'LINKS',
    ),
  ];

  final String userName;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          isChildWidget: true,
          title: userName,
          titleStyle: kTitleTextStyle.copyWith(
            fontSize: 20.0,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: kAppBarColor,
              child: const TabBar(tabs: myTabs),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MediaPage(
                    title: userName,
                  ),
                  const DocsPage(),
                  const LinksPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
