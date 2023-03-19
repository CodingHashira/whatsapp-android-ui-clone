import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class DeafultMessageTimerPage extends StatelessWidget {
  const DeafultMessageTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Default message timer',
      ),
      body: Column(
        children: [
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
                    text: data.textData['defaultMessageTimer']![0],
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
