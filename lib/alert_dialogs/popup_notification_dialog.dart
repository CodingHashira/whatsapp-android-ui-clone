import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/checkbox.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../common/text_button.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class PopupNotificationDialog extends StatelessWidget {
  const PopupNotificationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 115.0,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                'Popup notifications are no longer available in your version of Android',
                style: kSubTitleTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomTextButton(title: 'Learn more'),
                CustomTextButton(title: 'OK'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
