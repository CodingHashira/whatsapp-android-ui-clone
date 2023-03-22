import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class StatusPrivacyPage extends StatelessWidget {
  const StatusPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Status privacy',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PaddedSettingsTextInfo(
            text: 'Who can see my status updates',
          ),
          CustomListBuilder(
            startIndex: 0,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            itemCount: data.genericPrivacyRadioList.length,
            list: data.genericPrivacyRadioList,
            returnWidgetType: CustomRadioButton,
            skipItemList: const [0, 3],
          ),
          PaddedSettingsTextInfo(
            text: data.textData['statusPrivacy']![0],
          ),
        ],
      ),
    );
  }
}
