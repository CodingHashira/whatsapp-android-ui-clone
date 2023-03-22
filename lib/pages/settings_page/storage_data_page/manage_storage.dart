import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/color_dot.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/linear_percent_indicator.dart';

const data = Data();

class ManageStoragePage extends StatelessWidget {
  const ManageStoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isChildWidget: true, title: 'Manage storage'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: const [
                Text(
                  '83',
                  style: TextStyle(
                    color: kAccentColor,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  'GB',
                  style: TextStyle(
                    color: kAccentColor,
                    fontSize: 16.0,
                  ),
                ),
                Spacer(),
                Text(
                  '92',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  'GB',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Used',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  'Free',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: CustomLinearPercentIndicator(
              height: 15.0,
              percent: 0.3,
              color: Color(0xffffd179),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const ColorDot(color: kAccentColor),
                  Text(
                    'WhatsApp Media',
                    style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
                  ),
                ],
              ),
              Row(
                children: [
                  const ColorDot(color: Color(0xffffd179)),
                  Text(
                    'App and other items',
                    style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const CustomDivider(),
          const PaddedSettingsTextInfo(
            text: 'Tools to save space',
          ),
          CustomListTile(
            onTap: () =>
                Navigator.pushNamed(context, '/disappearingMessagesPage'),
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            leading: const Icon(
              Icons.timelapse_rounded,
              size: 28.0,
            ),
            title: 'Turn on disappearing messages',
            subTitle: data.textData['manageStorage']![0],
            subTitleIndent: 90,
          ),
          const CustomDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: kSubTitleTextStyle.copyWith(fontSize: 15.0),
                ),
                const Icon(
                  Icons.search_rounded,
                  color: kSecondaryColor,
                  size: 22.0,
                )
              ],
            ),
          ),
          CustomListBuilder(
            startIndex: 0,
            itemCount: data.chatsList.length,
            list: data.chatsList,
            returnWidgetType: ChatTile,
          )
        ],
      ),
    );
  }
}
