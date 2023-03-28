import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

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
            openChat: true,
            itemCount: data.conversaionList.length,
            list: data.conversaionList,
            startIndex: 0,
            returnWidgetType: ChatTile,
          )
        ],
      ),
    );
  }
}
