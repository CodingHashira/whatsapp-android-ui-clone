import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import '../common/text_button.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class ResetNetworkUsageDialog extends StatelessWidget {
  const ResetNetworkUsageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: SizedBox(
        height: 100.0,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                'Reset network usage statistics?',
                style: kSubTitleTextStyle.copyWith(fontSize: 15.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CustomTextButton(title: 'Cancel'),
                CustomTextButton(title: 'Reset'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
