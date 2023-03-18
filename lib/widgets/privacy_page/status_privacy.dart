import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';

import '../../common/padded_settings_textinfo.dart';
import '../../common/radio_button.dart';
import '../../model/data.dart';

const data = Data();

class StatusPrivacyPage extends StatelessWidget {
  const StatusPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Status privacy',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaddedSettingsTextInfo(
                  text: 'Who can see my status updates'),
              CustomListBuilder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: data.genericPrivacyRadioList.length,
                list: data.genericPrivacyRadioList,
                startIndex: 0,
                returnWidgetType: CustomRadioButton,
              ),
              const PaddedSettingsTextInfo(
                  text:
                      'Changes to your privacy settings wont affect status updates that you\'ve sent already'),
            ],
          )
        ],
      ),
    );
  }
}
