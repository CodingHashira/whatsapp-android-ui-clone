import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/conversation_about.dart';

import 'conversation_page/actions.dart';
import 'conversation_page/chat_box.dart';
import 'conversation_page/mic_button.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/chat_bubble.dart';

const data = Data();
final Size size = data.size;

class ConversationPage extends StatelessWidget {
  const ConversationPage({
    super.key,
    this.iconColor,
    required this.imageUrl,
    required this.userName,
    required this.about,
  });

  final Color? iconColor;
  final String imageUrl;
  final String userName;
  final String about;

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
          appBar: CustomAppBar(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationAboutPage(
                  title: userName,
                  imageUrl: imageUrl,
                  about: about,
                ),
              ),
            ),
            imageUrl: imageUrl,
            title: userName,
            isChildWidget: true,
            iconColor: iconColor,
            actions: const ChatPageActions(),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: ListView(
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
