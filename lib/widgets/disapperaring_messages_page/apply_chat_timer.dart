import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../../common/chat_tile.dart';
import '../../common/list_builder.dart';
import '../../common/padded_settings_textinfo.dart';

const data = Data();

class ApplyChatTimer extends StatelessWidget {
  const ApplyChatTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Apply timer to chats',
            actions: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.search,
                color: kTextPrimaryColor,
              ),
            ),
          ),
          const CustomListTile(
            leadingWidth: 10.0,
            leading: Icon(
              Icons.timelapse_rounded,
              size: 35.0,
            ),
            title: 'Disappering message timer',
            subTitle: '90 days',
          ),
          Container(
            height: 8.0,
            width: double.infinity,
            color: const Color(0xff0b141b),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const PaddedSettingsTextInfo(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            text: 'Apply message timer to these chats',
          ),
          CustomListBuilder(
            itemCount: data.conversaionList.length,
            list: data.conversaionList,
            startIndex: 0,
            returnWidgetType: ChatTile,
          ),
        ],
      ),
    );
  }
}
