import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/widgets/privacy_page/live_location.dart';

import '../../constants.dart';

class ChangeNumberPage extends StatelessWidget {
  const ChangeNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Change Number',
          ),
          const CustomImageContainer(
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            imageUrl: 'images/change_number.png',
            width: 86,
            paddingValue: 32,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Text(
              'Changing your phone number will migrate your account info, groups & settings.',
              style: kInfoTextStyle2.copyWith(height: 1.5),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text(
              'Before proceeding, please confirm that you are able to receive SMS or calls at your new number.',
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Text(
              'If you have both a new phone & a new number, first change your number on your Old phone.',
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
            ),
          ),
          const Spacer(),
          const CustomButton(title: 'Next')
        ],
      ),
    );
  }
}
