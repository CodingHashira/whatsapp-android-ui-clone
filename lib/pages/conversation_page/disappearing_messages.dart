import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class ConversationDisappearingMessagesPage extends StatelessWidget {
  const ConversationDisappearingMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Disappearing Messages',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: SizedBox(
              width: screenWidth / 1.6,
              child: Image.asset('images/dis_mes.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Make messages in this chat disappear',
                  style: kSubTitleTextStyle.copyWith(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomRichText(
                  textList: [
                    {
                      data.textData['disappearingMessages']![0]:
                          kSubTitleTextStyle.copyWith(height: 1.35),
                      data.textData['disappearingMessages']![1]:
                          kSubTitleTextStyle.copyWith(
                        color: kTextLinkColor,
                      ),
                    }
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const CustomDivider(),
          PaddedSettingsTextInfo(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            text: 'Message timer',
            textStyle: kInfoTextStyle2.copyWith(
              fontSize: 18.0,
            ),
          ),
          CustomListBuilder(
            leadingEndIndent: 5.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
            itemCount: 4,
            list: data.deafultMessageTimerList,
            startIndex: 0,
            returnWidgetType: CustomRadioButton,
          ),
          const CustomDivider(),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15.0),
            child: CustomRichText(
              textList: [
                {
                  'Update your': kSubTitleTextStyle,
                  ' default message timer ': kSubTitleTextStyle.copyWith(
                    color: kTextLinkColor,
                    fontSize: 15.0,
                  ),
                  'in Settings': kSubTitleTextStyle,
                }
              ],
            ),
          )
        ],
      ),
    );
  }
}
