import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/alert_dialogs/conversation_call.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class ChatPageActions extends StatelessWidget {
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
            onPressed: () => NavigationHelper.openDialog(
              context: context,
              dialogWidget:
                  const ConversationCallDialog(title: 'Start video call?'),
            ),
            icon: const Icon(
              Icons.videocam_rounded,
              color: Colors.white,
              size: 25.0,
            ),
          ),
          IconButton(
            onPressed: () => NavigationHelper.openDialog(
              context: context,
              dialogWidget:
                  const ConversationCallDialog(title: 'Start voice call?'),
            ),
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
