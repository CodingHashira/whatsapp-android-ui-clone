import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/content_gap.dart';

const data = Data();

class LinkedDevicesPage extends StatelessWidget {
  const LinkedDevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Linked devices',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          Center(
            child: SizedBox(
              height: screenWidth / 2.3,
              child: Image.asset(
                'images/linked_devices.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Center(
            child: Text(
              'Use WhatsApp on other devices',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          CustomRichText(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            textAlign: TextAlign.center,
            textList: [
              {
                data.textData['linkedDevices']![0]: kSubTitleTextStyle.copyWith(
                  fontSize: 15.5,
                ),
                'Learn more': kSubTitleTextStyle.copyWith(
                  color: kTextLinkColor,
                  fontSize: 15.5,
                )
              },
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: const [
                Expanded(
                  child: CustomButton(
                    title: 'Link a device',
                    routeName: ' ',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const ContentGap(),
          PaddedSettingsTextInfo(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            text: 'Device Status',
            textStyle: kSubTitleTextStyle.copyWith(fontSize: 14.0),
          ),
          PaddedSettingsTextInfo(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            text: 'Tap a device to log out.',
            textStyle: kSubTitleTextStyle.copyWith(fontSize: 14.0),
          ),
          CustomListTile(
            padding: const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 22.0,
              child: Image.asset('images/browser.png'),
            ),
            title: 'Microsoft Edge (Windows)',
            titleStyle: kTitleTextStyle.copyWith(fontWeight: FontWeight.normal),
            subTitle: 'Last active March 20, 12:00',
            subTitleStyle: kSubTitleTextStyle.copyWith(fontSize: 15.0),
          ),
          Expanded(
            child: Container(
              color: const Color(0xff0b141b),
              child: CustomRichText(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 25.0),
                textAlign: TextAlign.center,
                textList: [
                  {
                    data.textData['linkedDevices']![1]: kSubTitleTextStyle,
                    data.textData['linkedDevices']![2]:
                        kSubTitleTextStyle.copyWith(color: kAccentColor),
                    data.textData['linkedDevices']![3]: kSubTitleTextStyle,
                  },
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
