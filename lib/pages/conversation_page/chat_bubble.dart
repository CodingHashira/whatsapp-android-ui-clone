import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/delivery_indicator.dart';

import '../../constants.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
    required this.verticalGap,
  });

  final String text;
  final bool isMe;
  final String time;
  final double verticalGap;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      shadowColor: Colors.transparent,
      clipper: ChatBubbleClipper1(
        type: isMe ? BubbleType.sendBubble : BubbleType.receiverBubble,
      ),
      alignment: isMe ? Alignment.topRight : Alignment.topLeft,
      margin: EdgeInsets.all(verticalGap),
      backGroundColor: isMe ? kMyTextBubbleColor : kAppBarColor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: text.length < 38
                  ? isMe
                      ? const EdgeInsets.only(right: 45.0)
                      : const EdgeInsets.only(right: 33.0)
                  : null,
              child: Padding(
                padding: EdgeInsets.only(
                  left: !isMe ? 5.0 : 0.0,
                  right: isMe ? 5.0 : 0.0,
                ),
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: -2.0,
              right: isMe ? 20.0 : 2.0,
              child: Text(
                time,
                style: TextStyle(
                  color:
                      isMe ? const Color(0xff94c1bb) : const Color(0xff86969f),
                  fontSize: 10,
                ),
              ),
            ),
            isMe
                ? const Positioned(
                    bottom: -2.0,
                    child: DeliveryIndicator(
                      isSeen: true,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
