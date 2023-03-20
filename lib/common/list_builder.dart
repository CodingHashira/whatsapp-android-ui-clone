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
    this.tileMargin,
    this.titleStyle,
    this.skipItemList,
  });

  final int itemCount;
  final List list;
  final int? startIndex;
  final double? leadingWidth;
  final Type returnWidgetType;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? tileMargin;
  final TextStyle? titleStyle;
  final List<int>? skipItemList;

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
        } else if (returnWidgetType == CustomListTile) {
          if (skipItemList != null && skipItemList!.contains(index)) {
            return const SizedBox.shrink();
          } else {
            return _buildCustomListTile(index, context);
          }
        }
      },
    );
  }

  CustomRadioButton _buildRadioButton(int index) {
    return CustomRadioButton(
      leadingWidth: leadingWidth,
      value: list[index],
      optionsList: list,
      currentOption: list.first,
    );
  }

  void handleNavigation(BuildContext context, int index) {
    if (startIndex != null) initIndex = startIndex!;

    var pageRoute = list[index + initIndex]['pageRoute'];
    if (pageRoute != null) {
      Navigator.pushNamed(context, pageRoute);
    }

    var dialogWidget = list[index + initIndex]['dialogWidget'];
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
      leadingWidth: leadingWidth,
      padding: tileMargin,
      leading: list[index + initIndex]['leading'],
      title: list[index + initIndex]['title'],
      titleStyle: titleStyle,
      subTitle: list[index + initIndex]['subTitle'],
      subTitleIndent: list[index + initIndex]['subTitleIndent'],
      trailing: list[index + initIndex]['trailing'],
      isEnabled: list[index + initIndex]['isEnabled'],
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
