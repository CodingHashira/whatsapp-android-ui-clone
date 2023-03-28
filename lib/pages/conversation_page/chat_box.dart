import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/rupee_icon.dart';
import 'package:ui_flutter_whatsapp/common/text_field.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({
    Key? key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController? controller;

  static const iconSize = 23.0;
  static final double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: kAppBarColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 40),
                      child: CustomTextField(
                        onChanged: onChanged,
                        controller: controller,
                        hideBorder: true,
                        prefix: const Icon(
                          Icons.emoji_emotions_rounded,
                          color: kSecondaryColor,
                        ),
                        hintText: 'Message',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    width: screenWidth / 3.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Transform.rotate(
                          angle: 3.8,
                          child: const Icon(
                            Icons.attachment_rounded,
                            color: kSecondaryColor,
                            size: iconSize,
                          ),
                        ),
                        const RupeeIcon(),
                        const Icon(
                          Icons.photo_camera_rounded,
                          color: kSecondaryColor,
                          size: 23.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
