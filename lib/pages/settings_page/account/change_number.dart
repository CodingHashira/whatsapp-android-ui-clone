import 'package:flutter/material.dart';

import '../privacy/live_location.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';

const data = Data();

class ChangeNumberPage extends StatelessWidget {
  const ChangeNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Change Number',
      ),
      body: Column(
        children: [
          const CustomImageContainer(
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            imageUrl: 'images/change_number.jpg',
            width: 86,
            paddingValue: 32,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Text(
              data.textData['changeNumber']![0],
              style: kInfoTextStyle2.copyWith(height: 1.5),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text(
              data.textData['changeNumber']![1],
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Text(
              data.textData['changeNumber']![2],
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
            ),
          ),
          const Spacer(),
          const CustomButton(
            title: 'Next',
            routeName: ' ',
          )
        ],
      ),
    );
  }
}
