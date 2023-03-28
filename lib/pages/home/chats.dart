import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

import '../../common/rich_text.dart';

const data = Data();

class HomeChatsPage extends StatelessWidget {
  const HomeChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            minLeadingWidth: 33.0,
            contentPadding: const EdgeInsets.only(left: 25.0, top: 10.0),
            onTap: () => NavigationHelper.openRoute(
              context: context,
              pageRoute: '/archivedPage',
            ),
            leading: const Icon(
              Icons.archive_outlined,
              size: 25.0,
              color: kSecondaryColor,
            ),
            title: const Text(
              'Archived',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CustomListBuilder(
            onLongPress: () {},
            openChat: true,
            itemCount: data.conversaionList.length,
            list: data.conversaionList,
            startIndex: 0,
            returnWidgetType: ChatTile,
          ),
          const SizedBox(height: 20.0),
          Center(
            child: Text(
              'Tap and hold on a chat for more options',
              style: kSubTitleTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          const CustomDivider(),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock_rounded, size: 12.0),
              CustomRichText(
                textList: [
                  {
                    ' Your personal messages are ':
                        kSubTitleTextStyle.copyWith(fontSize: 14.0),
                    'end-to-end encrypted': kSubTitleTextStyle.copyWith(
                      fontSize: 14.0,
                      color: kAccentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  }
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
