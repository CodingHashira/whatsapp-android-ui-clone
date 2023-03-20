import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Privacy',
      ),
      body: SingleChildScrollView(
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
            CustomListTile(
              title: 'Read receipts',
              subTitle: data.textData['readReceiptSwitch']![0],
              subTitleIndent: 90,
              trailing: const CustomSwitch(),
            ),
            const CustomDivider(),
            const PaddedSettingsTextInfo(
              text: 'Disappearing messages',
            ),
            CustomListTile(
              trailingAlignment: Alignment.centerRight,
              subTitleIndent: 90,
              onTap: () =>
                  Navigator.pushNamed(context, '/deafultMessageTimerPage'),
              title: 'Default message timer',
              subTitle:
                  'Start new chats  with disapearing messages set to your timer',
              trailing: const Text(
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
    );
  }
}
