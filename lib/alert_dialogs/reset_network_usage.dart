import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import '../common/text_button.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class ResetNetworkUsageDialog extends StatelessWidget {
  const ResetNetworkUsageDialog({
    super.key,
    this.title,
  });

  final String? title;

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
            title != null
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 15.0, bottom: 5.0),
                    child: Text(
                      title!,
                      style: const TextStyle(
                        color: kTextPrimaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
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
