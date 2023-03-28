import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/text_button.dart';

class ArchiveChatsDialog extends StatelessWidget {
  const ArchiveChatsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 120.0,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                'Are you sure you want to archive ALL chats?',
                style: kSubTitleTextStyle.copyWith(fontSize: 15.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomTextButton(title: 'Cancel'),
                CustomTextButton(title: 'OK'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
