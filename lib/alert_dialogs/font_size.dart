import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class FontSizeDialog extends StatelessWidget {
  const FontSizeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
      content: SizedBox(
        height: 200,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Font size',
                style: TextStyle(
                  color: kTextPrimaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomListBuilder(
              padding: const EdgeInsets.only(left: 5.0),
              startIndex: 0,
              itemCount: data.fontSizeRadioOptions.length,
              list: data.fontSizeRadioOptions,
              returnWidgetType: CustomRadioButton,
            ),
          ],
        ),
      ),
    );
  }
}
