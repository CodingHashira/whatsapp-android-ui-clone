import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/checkbox.dart';
import 'package:ui_flutter_whatsapp/common/text_button.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class ClearAllChatsDialog extends StatelessWidget {
  const ClearAllChatsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 280.0,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10.0),
              child: Text(
                'Clear all chats?',
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 25.0),
              child: Text(
                data.textData['clearAllChatsDialog']![0],
                style: kSubTitleTextStyle.copyWith(height: 1.5),
              ),
            ),
            CustomCheckBox(label: data.textData['clearAllChatsDialog']![1]),
            const CustomCheckBox(label: 'Delete starred messages'),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomTextButton(title: 'Cancel'),
                CustomTextButton(title: 'Clear chats'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
