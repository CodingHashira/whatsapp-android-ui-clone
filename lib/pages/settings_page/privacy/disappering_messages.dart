import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class DisappearingMessagesPage extends StatelessWidget {
  const DisappearingMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Disappearing messages',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 35.0),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color(0xff0f3633),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'images/timer.jpg',
                height: 80,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Set messages to automatically disappear',
                style: kInfoTextStyle2,
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              data.textData['readReceiptSwitch']![0],
              style: kInfoTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Learn more',
                style:
                    kInfoTextStyle.copyWith(color: kTextLinkColor, height: 1),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const CustomDivider(),
          const PaddedSettingsTextInfo(text: 'Set for your account'),
          const CustomListTile(
            padding: EdgeInsets.only(top: 0.0),
            // setLeadingAtTop: true,
            // padding: EdgeInsets.only(left: 20.0, top: 10.0),

            title: 'Default message timer',
            leading: Icon(
              Icons.person_rounded,
            ),
            // leadingIndent: 10.0,
            subTitle: 'New chats will begin with a disappearing message timer',
          ),
          const PaddedSettingsTextInfo(text: 'Set for your current chats'),
          const CustomListTile(
            // setLeadingAtTop: true,
            // padding: EdgeInsets.only(left: 20.0, top: 10.0),
            title: 'Apply timer to chats',
            // leadingIndent: 10.0,
            leading: Icon(
              Icons.list_alt_rounded,
            ),
            subTitle: '4 chats using disappearing messages',
          ),
        ],
      ),
    );
  }
}
