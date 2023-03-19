import 'package:flutter/material.dart';

import '../../../../constants.dart';

class PreviewChatBox extends StatelessWidget {
  const PreviewChatBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
        height: 22.0,
        decoration: BoxDecoration(
          color: kAppBarColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              const Icon(
                Icons.emoji_emotions_rounded,
                size: 15.0,
              ),
              const SizedBox(width: 3.0),
              const Text(
                'Message',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 9.0,
                ),
              ),
              const Spacer(),
              Transform.rotate(
                angle: 3.8,
                child: const Icon(
                  Icons.attachment_rounded,
                  color: kSecondaryColor,
                  size: 15.0,
                ),
              ),
              const SizedBox(width: 3.0),
              const Icon(
                Icons.photo_camera_rounded,
                size: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
