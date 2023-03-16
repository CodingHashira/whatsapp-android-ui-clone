import 'package:flutter/material.dart';

import '../../common/popup_menu_button.dart';
import '../../constants.dart';
import '../../model/data.dart';

final data = Data();

class ChatPageActions extends StatelessWidget {
  const ChatPageActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.videocam_rounded,
            color: Colors.white,
            size: 25.0,
          ),
          const Icon(
            Icons.call_rounded,
            color: Colors.white,
            size: 25.0,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 25.0, maxHeight: 25),
            child: CustomPopupMenuButton(
              popButtonColor: kTextPrimaryColor,
              popupMenuItems: data.chatPopupMenuItems,
            ),
          )
        ],
      ),
    );
  }
}
