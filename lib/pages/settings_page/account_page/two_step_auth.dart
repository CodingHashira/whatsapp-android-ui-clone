import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/privacy_page/live_location.dart';

import '../../../common/button.dart';
import '../../../constants.dart';

class TwoStepAuthPage extends StatelessWidget {
  const TwoStepAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Two-step verification',
          ),
          const CustomImageContainer(
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            imageUrl: 'images/password.jpg',
            width: 75,
            paddingValue: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'For extra security, turn on two-step verification, which will require a PIN when registering your phone number with WhatsApp again.',
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          const CustomButton(title: 'Turn on')
        ],
      ),
    );
  }
}
