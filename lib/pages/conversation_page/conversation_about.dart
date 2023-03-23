import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/button_bar.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/content_gap.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/custom_tile.dart';

const data = Data();

class ConversationAboutPage extends StatelessWidget {
  const ConversationAboutPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 27.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0, top: 8.0),
                  child: Hero(
                    tag: 'profileImage',
                    child: CircleAvatar(
                      radius: 55.0,
                      backgroundImage: AssetImage('images/p3.jpg'),
                    ),
                  ),
                ),
                const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 27.0,
                )
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          const Center(
            child: Text(
              '+91 9983664738',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 20.0,
              ),
            ),
          ),
          const CustomButtonBar(),
          const ContentGap(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I wish I could pivot my way out of this week, just like Ross did with that couch',
                  style: kInfoTextStyle2.copyWith(
                    fontSize: 16.0,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'September 1, 2018',
                  style: kSubTitleTextStyle,
                ),
              ],
            ),
          ),
          const ContentGap(),
          CustomListBuilder(
            leadingIndent: 3.0,
            leadingEndIndent: 20.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            itemCount: 3,
            list: data.aboutPageOptionList,
            startIndex: 0,
            returnWidgetType: CustomListTile,
          ),
          const ContentGap(),
          CustomListBuilder(
            leadingEndIndent: 22,
            itemCount: 2,
            list: data.aboutPageOptionList,
            startIndex: 3,
            returnWidgetType: CustomListTile,
          ),
          const ContentGap(),
          const PaddedSettingsTextInfo(text: '1 Group in common'),
          CustomListTile(
            leading: Container(
              decoration: const BoxDecoration(
                color: kAccentColor,
                shape: BoxShape.circle,
              ),
              // margin: const EdgeInsets.only(left: 5.0, right: 8.0),
              padding: const EdgeInsets.all(5.0),
              child: const Icon(
                Icons.people,
                color: Colors.white,
                // size: 22.0,
              ),
            ),
            title: 'Create group with $title',
          ),
          CustomListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('images/g1.jpg'),
            ),
            title: 'F.R.I.E.N.D.S',
            titleStyle: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
            subTitle: 'Chandler, Joey, Monica, Phoebe, Rachael, Ros..',
          ),
          const ContentGap(),
          CustomTile(
            icon: FeatherIcons.slash,
            title: 'Block  $title',
          ),
          CustomTile(
            icon: Icons.thumb_down_rounded,
            title: 'Report  $title',
          ),
          const SizedBox(height: 5.0),
          const ContentGap(height: 15.0),
        ],
      ),
    );
  }
}
