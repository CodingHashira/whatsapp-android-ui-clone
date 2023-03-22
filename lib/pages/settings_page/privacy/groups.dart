import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Groups',
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaddedSettingsTextInfo(text: 'Who canadd me to groups'),
              CustomListBuilder(
                startIndex: 0,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: data.genericPrivacyRadioList.length,
                list: data.genericPrivacyRadioList,
                returnWidgetType: CustomRadioButton,
              ),
              PaddedSettingsTextInfo(text: data.textData['groups']![0]),
            ],
          )
        ],
      ),
    );
  }
}
