import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/checkbox.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../common/text_button.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class MobileDataDialog extends StatelessWidget {
  const MobileDataDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 285,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 5.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomListBuilder(
              startIndex: 0,
              itemCount: data.mobileDataDialogList.length,
              list: data.mobileDataDialogList,
              checkStyle: kInfoTextStyle2.copyWith(fontSize: 16.0),
              returnWidgetType: CustomCheckBox,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomTextButton(title: 'Cancel'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
