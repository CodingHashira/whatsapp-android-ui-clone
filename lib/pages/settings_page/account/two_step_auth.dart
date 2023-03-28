import 'package:flutter/material.dart';

import '../privacy/live_location.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';

const data = Data();

class TwoStepAuthPage extends StatelessWidget {
  const TwoStepAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Two-step verification',
      ),
      body: Column(
        children: [
          const CustomImageContainer(
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            imageUrl: 'images/password.jpg',
            width: 75,
            paddingValue: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              data.textData['twoStepAuth']![0],
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          const CustomButton(
            title: 'Turn on',
            routeName: '/',
          ),
          const SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
