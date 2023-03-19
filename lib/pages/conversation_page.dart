import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/chat_bubble.dart';

import '../common/appbar.dart';
import 'conversation_page/actions.dart';
import 'conversation_page/chat_box.dart';
import 'conversation_page/mic_button.dart';

const data = Data();

const List<Map<String, String>> testList = [
  {
    'sender': 'me',
    'text': 'Sure, I\'d be happy to help. Let\'s plan a fun trip!',
  },
];

final Size size =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.darken,
          ),
          child: Image.asset(
            'images/bg.jpg',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const CustomAppBar(
                imageUrl: 'images/p3.jpg',
                title: 'Monica',
                isChildWidget: true,
                actions: ChatPageActions(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomListBuilder(
                        itemCount: data.messageList.length,
                        list: data.messageList,
                        startIndex: 0,
                        returnWidgetType: CustomChatBubble,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const [
                    ChatBox(),
                    SizedBox(width: 5.0),
                    MicButton(
                      iconSize: 25.0,
                      padding: 10.0,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ],
    );
  }
}
