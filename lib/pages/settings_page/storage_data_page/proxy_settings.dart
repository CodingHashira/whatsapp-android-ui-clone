import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class ProxySettingsPage extends StatelessWidget {
  const ProxySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Proxy',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            title: 'Use proxy',
            subTitleWidget: CustomRichText(
              textList: [
                {
                  data.textData['proxy']![0]: kSubTitleTextStyle,
                  ' Learn more': kSubTitleTextStyle.copyWith(
                    color: kTextLinkColor,
                  )
                },
              ],
            ),
            subTitleIndent: 85.0,
            trailing: const CustomSwitch(),
          ),
          const PaddedSettingsTextInfo(text: 'Connection'),
          CustomListTile(
            // isEnabled: false,
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            title: 'Set proxy',
            titleStyle: kTitleTextStyle.copyWith(color: kDisabledTextColor),
            subTitle: 'Not set',
            subTitleStyle:
                kSubTitleTextStyle.copyWith(color: kDisabledTextColor),
          )
        ],
      ),
    );
  }
}
