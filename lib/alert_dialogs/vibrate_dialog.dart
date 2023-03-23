import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class VibrateDialog extends StatelessWidget {
  const VibrateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 260,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Vibrate',
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomListBuilder(
              startIndex: 0,
              leadingIndent: 0,
              itemCount: data.vibrateDialogOptionList.length,
              list: data.vibrateDialogOptionList,
              returnWidgetType: CustomRadioButton,
            ),
          ],
        ),
      ),
    );
  }
}
