import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

import '../../../model/data.dart';

const data = Data();

class DeafultMessageTimerPage extends StatelessWidget {
  const DeafultMessageTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Default message timer',
          ),
          PaddedSettingsTextInfo(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
            textStyle: kInfoTextStyle.copyWith(fontSize: 14.0, height: 1.2),
            text: 'Start new chats with a disappearing message timer set to',
          ),
          CustomListBuilder(
            padding: const EdgeInsets.only(left: 10.0),
            itemCount: 4,
            list: data.deafultMessageTimerList,
            startIndex: 0,
            returnWidgetType: CustomRadioButton,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0, right: 30.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'When turned on, all new individual chats will start with disappearing messages set to the duration you select. This setting will not affect your existing chats.',
                    style: kInfoTextStyle.copyWith(
                      fontSize: 14.0,
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: ' Learn more',
                    style: kInfoTextStyle.copyWith(
                      color: kAccentColor,
                      height: 0.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
