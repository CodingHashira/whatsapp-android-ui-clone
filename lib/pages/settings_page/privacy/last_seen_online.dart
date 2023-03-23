import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class LastSeenOnlinePage extends StatelessWidget {
  const LastSeenOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Last seen and online',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PaddedSettingsTextInfo(text: 'Who can see my last seen'),
          CustomListBuilder(
            startIndex: 0,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            itemCount: data.lastSeenRadioList.length,
            list: data.lastSeenRadioList,
            returnWidgetType: CustomRadioButton,
          ),
          const SizedBox(height: 5.0),
          const CustomDivider(),
          const SizedBox(height: 5.0),
          const PaddedSettingsTextInfo(text: 'Who can see when I\'m online'),
          CustomListBuilder(
            startIndex: 0,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            itemCount: data.onlineIndicationRadioList.length,
            list: data.onlineIndicationRadioList,
            returnWidgetType: CustomRadioButton,
          ),
          const SizedBox(height: 20.0),
          CustomRichText(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            textList: [
              {
                'If you don\'t share your ': kSubTitleTextStyle,
                'last seen':
                    kInfoTextStyle.copyWith(fontWeight: FontWeight.w500),
                ' and ': kSubTitleTextStyle,
                'online': kInfoTextStyle.copyWith(fontWeight: FontWeight.w500),
                data.textData['lastSeenOnline']![0]: kSubTitleTextStyle,
              }
            ],
          )
        ],
      ),
    );
  }
}
