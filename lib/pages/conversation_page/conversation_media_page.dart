import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/conversation_media/docs.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/conversation_media/links.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/conversation_media/media.dart';
import 'package:ui_flutter_whatsapp/widgets/conversation_media/tab.dart';

class ConversationMediaPage extends StatelessWidget {
  const ConversationMediaPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          isChildWidget: true,
          title: 'Monica',
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
            const Expanded(
              child: TabBarView(
                children: [
                  MediaPage(),
                  DocsPage(),
                  LinksPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
