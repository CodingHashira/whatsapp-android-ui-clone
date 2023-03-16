import 'package:flutter/material.dart';
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
                  const Expanded(
                    child: TextField(
                      maxLines: null,
                      cursorColor: kAccentColor,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        suffixIconColor: kSecondaryColor,
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 18.0,
                        ),
                        prefixIcon: Icon(
                          Icons.mood,
                          color: kSecondaryColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 3.3,
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
                          decoration: const BoxDecoration(
                            color: kSecondaryColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(2.8),
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
