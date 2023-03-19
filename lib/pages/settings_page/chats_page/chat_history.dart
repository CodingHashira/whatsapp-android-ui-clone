import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Chat history',
          ),
          CustomListBuilder(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            itemCount: data.chatHistoryOptionsList.length,
            list: data.chatHistoryOptionsList,
            startIndex: 0,
            returnWidgetType: CustomListTile,
          ),
        ],
      ),
    );
  }
}
