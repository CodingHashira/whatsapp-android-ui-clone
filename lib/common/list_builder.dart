import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
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
    required this.returnWidgetType,
    this.padding,
    this.listTilePadding,
    this.titleColor,
    this.titleSize,
  });

  final int itemCount;
  final List list;
  final int startIndex;
  final double? leadingWidth;
  final Type returnWidgetType;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? listTilePadding;
  final Color? titleColor;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: padding ?? const EdgeInsets.only(top: 0.0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (returnWidgetType == ChatBubble) {
          return _buildChatBubble(index);
        } else if (returnWidgetType == ChatTile) {
          return _buildChatTile(index);
        } else if (returnWidgetType == CustomRadioButton) {
          return _buildRadioButton(index);
        }
        return _buildCustomListTile(index, context);
      },
    );
  }

  CustomRadioButton _buildRadioButton(int index) {
    return CustomRadioButton(
      value: list[index],
      optionsList: list,
      currentOption: list.first,
    );
  }

  void handleNavigation(BuildContext context, int index) {
    var pageRoute = list[index + startIndex]['pageRoute'];
    if (pageRoute != null) {
      Navigator.pushNamed(context, pageRoute);
    }

    var dialogWidget = list[index + startIndex]['dialogWidget'];
    if (dialogWidget != null) {
      showDialog(
        context: context,
        builder: (context) {
          return dialogWidget;
        },
      );
    }
  }

  CustomListTile _buildCustomListTile(int index, BuildContext context) {
    return CustomListTile(
      onTap: () => handleNavigation(context, index),
      padding: listTilePadding ??
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      leading: list[index + startIndex]['leading'],
      leadingWidth: leadingWidth,
      title: list[index + startIndex]['title'],
      titleColor: titleColor,
      titleSize: titleSize,
      subTitle: list[index + startIndex]['subTitle'],
      trailingWidget: list[index + startIndex]['trailing'],
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
        radius: 23.0,
        backgroundColor: Color.fromARGB(255, 78, 95, 105),
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
