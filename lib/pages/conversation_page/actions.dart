import 'package:flutter/material.dart';

import '../../common/popup_menu_button.dart';
import '../../constants.dart';
import '../../model/data.dart';

class ChatPageActions extends StatelessWidget {
  static const data = Data();

  const ChatPageActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam_rounded,
              color: Colors.white,
              size: 25.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_rounded,
              color: Colors.white,
              size: 25.0,
            ),
          ),
          Builder(
            builder: (context) => CustomPopupMenuButton(
              popButtonColor: kTextPrimaryColor,
              popupMenuItems: data.chatPopupMenuItems,
            ),
          ),
        ],
      ),
    );
  }
}
