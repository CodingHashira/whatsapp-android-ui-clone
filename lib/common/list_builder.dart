import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/chat_bubble.dart';

var initIndex = 0;
var previousSender = '';
var verticalGap = 5.0;

class CustomListBuilder extends StatelessWidget {
  const CustomListBuilder({
    super.key,
    required this.itemCount,
    required this.list,
    this.startIndex,
    this.leadingWidth,
    required this.returnWidgetType,
    this.padding,
    this.listTilePadding,
    this.titleColor,
    this.titleSize,
  });

  final int itemCount;
  final List list;
  final int? startIndex;
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
        if (returnWidgetType == CustomChatBubble) {
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
    if (startIndex != null) initIndex = startIndex!;

    var pageRoute = list[index]['pageRoute'];
    if (pageRoute != null) {
      Navigator.pushNamed(context, pageRoute);
    }

    var dialogWidget = list[index]['dialogWidget'];
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
    if (startIndex != null) initIndex = startIndex!;

    return CustomListTile(
      onTap: () => handleNavigation(context, index),
      padding: listTilePadding ??
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      leading: list[index + initIndex]['leading'],
      leadingWidth: leadingWidth,
      title: list[index + initIndex]['title'],
      titleColor: titleColor,
      titleSize: titleSize,
      subTitle: list[index + initIndex]['subTitle'],
      trailingWidget: list[index + initIndex]['trailing'],
    );
  }

  CustomChatBubble _buildChatBubble(int index) {
    if (previousSender == '') {
      previousSender = list[index]['sender'];
    }

    if (previousSender == list[index]['sender']) {
      verticalGap = 2;
    } else {
      verticalGap = 8.0;
    }

    return CustomChatBubble(
      verticalGap: verticalGap,
      text: list[index]['text'],
      isMe: list[index]['sender'] == 'me',
      time: '12:20',
    );
  }

  ChatTile _buildChatTile(int index) {
    return ChatTile(
      leading: CircleAvatar(
        radius: 23.0,
        backgroundColor: const Color.fromARGB(255, 78, 95, 105),
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
