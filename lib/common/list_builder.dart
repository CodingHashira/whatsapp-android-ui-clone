import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/widgets/chat_page/chat_bubble.dart';

import 'chat_tile.dart';
import 'list_tile.dart';

class CustomListBuilder extends StatelessWidget {
  const CustomListBuilder({
    super.key,
    required this.itemCount,
    required this.list,
    required this.startIndex,
    this.leadingWidth,
    this.widgetType,
  });

  final int itemCount;
  final List list;
  final int startIndex;
  final double? leadingWidth;
  final Type? widgetType;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: const EdgeInsets.only(top: 0.0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (widgetType != null && widgetType == ChatBubble) {
          return _buildChatBubble(index);
        } else if (widgetType != null && widgetType == ChatTile) {
          return _buildChatTile(index);
        }
        return _buildCustomListTile(index);
      },
    );
  }

  CustomListTile _buildCustomListTile(int index) {
    return CustomListTile(
      leading: list[index + startIndex]['leading'],
      leadingWidth: leadingWidth,
      title: list[index + startIndex]['title'],
      subTitle: list[index + startIndex]['subTitle'],
    );
  }

  ChatBubble _buildChatBubble(int index) {
    return ChatBubble(
      text: list[index]['text'].trim(),
      isMe: list[index]['sender'] == 'me',
      textLength: list[index]['text'].length,
    );
  }

  ChatTile _buildChatTile(int index) {
    return ChatTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage(
          list[index].imageUrl,
        ),
      ),
      title: list[index].title,
      time: list[index].time,
      subTitle: list[index].subTitle,
    );
  }
}
