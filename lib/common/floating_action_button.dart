import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/home/add_text_status.dart';
import 'package:ui_flutter_whatsapp/pages/home/new_conversation_action.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    required this.index,
    required this.showEditButton,
  });

  final IconData icon;
  final int index;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 70.0,
          right: 5.0,
          child: Visibility(
            visible: showEditButton,
            child: SizedBox(
              height: 50.0,
              child: FloatingActionButton(
                backgroundColor: kAppBarColor,
                onPressed: () => NavigationHelper.openPage(
                  context: context,
                  page: const AddTextStatusPage(),
                ),
                child: const Icon(
                  Icons.edit_rounded,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 5.0,
          child: FloatingActionButton(
            heroTag: 'fab',
            onPressed: index == 3
                ? () => NavigationHelper.openPage(
                      context: context,
                      page: const NewConversationActionPage(pageType: 'call'),
                    )
                : null,
            child: Icon(icon),
          ),
        ),
      ],
    );
  }
}
