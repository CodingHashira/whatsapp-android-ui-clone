import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/text_button.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';

const data = Data();

class MediaVisibilityDialog extends StatelessWidget {
  const MediaVisibilityDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 290,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Show newly downloaded media from this chat in your device\'s gallery?',
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomListBuilder(
              startIndex: 0,
              leadingIndent: 0.0,
              itemCount: data.mediaVisibilityRadioList.length,
              list: data.mediaVisibilityRadioList,
              returnWidgetType: CustomRadioButton,
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
