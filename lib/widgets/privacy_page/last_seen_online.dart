// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

import '../../common/padded_settings_textinfo.dart';
import '../../common/radio_button.dart';

List lastSeenRadioList = [
  'Everyone',
  'My contacts',
  'My contacts except...',
  'Nobody'
];

List onlineIndicationRadioList = [
  'Everyone',
  'Same as last seen',
];

class LastSeenOnlinePage extends StatelessWidget {
  const LastSeenOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Last seen and online',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaddedSettingsTextInfo(text: 'Who can see my last seen'),
              CustomListBuilder(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: lastSeenRadioList.length,
                list: lastSeenRadioList,
                startIndex: 0,
                returnWidgetType: CustomRadioButton,
              ),
              SizedBox(height: 5.0),
              CustomDivider(),
              SizedBox(height: 5.0),
              PaddedSettingsTextInfo(text: 'Who can see when I\'m online'),
              CustomListBuilder(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: onlineIndicationRadioList.length,
                list: onlineIndicationRadioList,
                startIndex: 0,
                returnWidgetType: CustomRadioButton,
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'If you don\'t share your '),
                      TextSpan(
                        text: 'last seen',
                        style: kInfoTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'online',
                        style: kInfoTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                          text:
                              ', you won\'t be able to see other people\'s last seen and online.')
                    ],
                  ),
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
