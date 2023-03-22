import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class PreviewChatBubble extends StatelessWidget {
  const PreviewChatBubble({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          height: 20,
          width: 100,
          decoration: BoxDecoration(
            color: isMe ? kMyTextBubbleColor : kAppBarColor,
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe ? const Radius.circular(10) : const Radius.circular(0),
              topRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(10),
              bottomLeft: const Radius.circular(10),
              bottomRight: const Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
