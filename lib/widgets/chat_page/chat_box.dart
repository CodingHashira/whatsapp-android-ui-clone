import 'package:flutter/material.dart';
import '../../common/text_field.dart';
import '../../constants.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({
    Key? key,
  }) : super(key: key);

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
                      child: const CustomTextField(
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
                        Container(
                          padding: const EdgeInsets.all(2.8),
                          decoration: const BoxDecoration(
                            color: kSecondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.currency_rupee_rounded,
                            color: kPrimaryColor,
                            size: 14.0,
                          ),
                        ),
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
