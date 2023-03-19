import 'package:flutter/material.dart';

import './preview_chatbox.dart';
import './preview_chat_bubble.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/mic_button.dart';

final double screenWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

class WallpaperPreview extends StatelessWidget {
  const WallpaperPreview({
    super.key,
    required this.imageOpacity,
  });

  final double imageOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: screenWidth / 1,
      width: screenWidth / 2,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(imageOpacity),
            BlendMode.darken,
          ),
          image: const AssetImage(
            'images/bg.jpg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Container(
            height: 30.0,
            decoration: const BoxDecoration(
              color: kAppBarColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 12.0,
                    backgroundColor: kIconSecondaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.5),
                      child: Icon(
                        Icons.person,
                        color: Color(0xffced8df),
                        size: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 3.0),
                  Text(
                    'Contact Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                height: 15.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: kAppBarColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              )
            ],
          ),
          const PreviewChatBubble(isMe: false),
          const PreviewChatBubble(isMe: true),
          const Spacer(),
          Row(
            children: const [
              PreviewChatBox(),
              MicButton(
                iconSize: 12.0,
                padding: 5.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
