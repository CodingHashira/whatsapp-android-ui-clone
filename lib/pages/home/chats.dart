import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class HomeChatsPage extends StatelessWidget {
  const HomeChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'fab',
      //   onPressed: () {},
      //   child: const Icon(Icons.chat_rounded),
      // ),
      body: ListView(
        children: [
          CustomListTile(
            onTap: () => NavigationHelper.openRoute(
              context: context,
              pageRoute: '/archivedPage',
            ),
            leadingIndent: 15.0,
            leadingEndIndent: 24.0,
            leading: const Icon(
              Icons.archive_outlined,
              size: 25.0,
              color: kSecondaryColor,
            ),
            title: 'Archived',
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
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
