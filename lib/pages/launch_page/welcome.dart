import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/launch_page/phone_number.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

import '../../common/rich_text.dart';

const data = Data();

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: screenWidth / 1.5,
              child: Image.asset(
                'images/doodle.png',
                isAntiAlias: true,
                color: kAccentColor,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          const Text(
            'Welcome to WhatsApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12.0),
          CustomRichText(
            textAlign: TextAlign.center,
            textList: [
              {
                data.textData['welcome']![0]: kSubTitleTextStyle.copyWith(
                  fontSize: 14.0,
                ),
                data.textData['welcome']![1]: kSubTitleTextStyle.copyWith(
                  color: kTextLinkColor,
                ),
                data.textData['welcome']![2]: kSubTitleTextStyle.copyWith(
                  fontSize: 14.0,
                ),
                data.textData['welcome']![3]: kSubTitleTextStyle.copyWith(
                  color: kTextLinkColor,
                ),
              }
            ],
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            onPressed: () => NavigationHelper.openPage(
              context: context,
              page: const GetPhoneNumberPage(),
            ),
            width: 250.0,
            title: 'Agree and continue',
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff182329),
                borderRadius: BorderRadius.circular(20.0)),
            margin: const EdgeInsets.only(top: 30.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.language_rounded,
                  color: kAccentColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'English',
                    style: kSubTitleTextStyle.copyWith(color: kAccentColor),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: kAccentColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
