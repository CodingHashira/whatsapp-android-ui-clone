import 'package:flutter/material.dart';

import '../constants.dart';
import 'popup_menu_item.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 0.0,
      constraints: const BoxConstraints(minWidth: 190),
      color: kPopupMenuColor,
      icon: const Icon(
        Icons.more_vert_rounded,
        color: kSecondaryColor,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 32,
          child: CustomPopupMenuItem(
            title: 'Archive Settings',
            onTap: () => Future(
              () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/archiveSettingsPage');
              },
            ),
          ),
        ),
      ],
    );
  }
}
