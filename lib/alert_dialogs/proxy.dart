import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/text_field.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/text_button.dart';

class ProxyDialog extends StatelessWidget {
  const ProxyDialog({
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
        height: 150.0,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 15.0),
              child: Text(
                'Set proxy',
                style: kTitleTextStyle.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextField()),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomTextButton(title: 'Cancel'),
                CustomTextButton(title: 'Save'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
