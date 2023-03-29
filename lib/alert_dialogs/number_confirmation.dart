import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/text_button.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';
import 'package:ui_flutter_whatsapp/pages/launch_page/verify_number.dart';

class NumberConfirmationDialog extends StatelessWidget {
  const NumberConfirmationDialog({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      content: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'You entered the phone number:',
                style: kSubTitleTextStyle,
              ),
              const SizedBox(height: 15.0),
              Text(
                '+91 $number',
                style: kSubTitleTextStyle.copyWith(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Is this 0K, or would you like to edit the number?',
                style: kSubTitleTextStyle.copyWith(fontSize: 15.5),
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextButton(title: 'Edit'),
                  CustomTextButton(
                    title: 'OK',
                    onTap: () => NavigationHelper.openPage(
                      context: context,
                      page: VerifyNumberPage(number: number),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
