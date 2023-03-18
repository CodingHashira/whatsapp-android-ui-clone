import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/widgets/chat_page/delivery_indicator.dart';

import '../../constants.dart';

final double screenWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isMe,
    required this.textLength,
    this.showTime,
  }) : super(key: key);

  final String text;
  final bool isMe;
  final int textLength;
  final bool? showTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: screenWidth / 1.2,
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: isMe ? kMyTextBubbleColor : kAppBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: isMe
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  topRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                  bottomRight: const Radius.circular(10),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          // text,

                          textLength > 38 && (textLength ~/ 38) < 2 ||
                                  (textLength % 38) > 18
                              ? '$text\n'
                              : text,
                          style: const TextStyle(
                            color: kTextPrimaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '12:34 PM',
                          style: TextStyle(
                            color: isMe
                                ? const Color(0xff94c1bb)
                                : const Color(0xff86969f),
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3.0),
                      isMe
                          ? const DeliveryIndicator()
                          : const SizedBox.shrink(),
                      // const SizedBox(width: 5.0),
                    ],
                  ),
                ],
              ),
            ),
            // Container(
            //   height: 20,
            //   width: 20,
            //   color: Colors.red,
            // )
          ],
        ),
      ],
    );
  }
}
