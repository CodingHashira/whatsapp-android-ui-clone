import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

final double screenHeight =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Avatar',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xff0b141b),
            height: screenHeight / 2.4,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'images/avatar.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  PaddedSettingsTextInfo(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    text: 'Say more with Avatars now on WhatsApp',
                    textStyle: kInfoTextStyle2.copyWith(fontSize: 14.0),
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: CustomButton(
                          title: 'Create your Avatar',
                          routeName: '/',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PaddedSettingsTextInfo(
            text: ' Learn more',
            textStyle: kInfoTextStyle.copyWith(
              color: kTextLinkColor,
              height: 0.0,
            ),
          )
        ],
      ),
    );
  }
}
