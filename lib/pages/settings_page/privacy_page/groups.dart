import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';

import '../../../common/padded_settings_textinfo.dart';
import '../../../common/radio_button.dart';
import '../../../model/data.dart';

const data = Data();

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Groups',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaddedSettingsTextInfo(text: 'Who canadd me to groups'),
              CustomListBuilder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: 3,
                list: data.genericPrivacyRadioList,
                startIndex: 0,
                returnWidgetType: CustomRadioButton,
              ),
              const PaddedSettingsTextInfo(
                  text:
                      'Admins who can\'t add you to a group chat will have the option of inviting you privately instead.'),
            ],
          )
        ],
      ),
    );
  }
}
