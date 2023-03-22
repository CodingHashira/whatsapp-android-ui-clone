import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/checkbox.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../common/text_button.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class DeleteAllChatsDialog extends StatelessWidget {
  const DeleteAllChatsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 250.0,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10.0),
              child: Text(
                'Delete all chats?',
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
                data.textData['deleteAllChatsDialog']![0],
                style: kSubTitleTextStyle.copyWith(height: 1.5),
              ),
            ),
            CustomCheckBox(label: data.textData['deleteAllChatsDialog']![1]),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: const [
                CustomTextButton(title: 'Cancel'),
                CustomTextButton(title: 'Delete chats'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
