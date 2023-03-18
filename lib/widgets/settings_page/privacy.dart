import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

import '../../common/list_builder.dart';
import '../../model/data.dart';

const data = Data();

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Privacy',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 20.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          'Who can see my personal info',
                          style: kInfoTextStyle,
                        ),
                      ),
                    ],
                  ),
                  CustomListBuilder(
                    startIndex: 0,
                    itemCount: 4,
                    list: data.privacyMenu,
                    returnWidgetType: CustomListTile,
                  ),
                  const CustomListTile(
                    title: 'Read receipts',
                    subTitle:
                        ' If turned Off, you won\'t send or receive Read receipts. Read receipts are always sent for group chats.',
                    trailingWidget: CustomSwitch(),
                  ),
                  const CustomDivider(),
                  const PaddedSettingsTextInfo(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
                    text: 'Disappearing messages',
                  ),
                  CustomListTile(
                    onTap: () => Navigator.pushNamed(
                        context, '/deafultMessageTimerPage'),
                    padding: const EdgeInsets.only(
                        left: 20.0, bottom: 20.0, right: 30.0),
                    title: 'Default message timer',
                    subTitle:
                        'Start new c ats wit set to your timer isappearing messages',
                    trailingWidget: const Text(
                      'Off',
                      style: kSubTitleTextStyle,
                    ),
                  ),
                  const CustomDivider(),
                  CustomListBuilder(
                    startIndex: 4,
                    itemCount: 4,
                    list: data.privacyMenu,
                    returnWidgetType: CustomListTile,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
