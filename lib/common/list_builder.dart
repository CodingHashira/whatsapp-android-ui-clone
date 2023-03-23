import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/checkbox.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/radio_button.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/chat_bubble.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';
import 'package:ui_flutter_whatsapp/widgets/country_code_tile.dart';
import 'package:ui_flutter_whatsapp/widgets/network_usage/network_tile.dart';

var previousSender = '';
var verticalGap = 5.0;

class CustomListBuilder extends StatelessWidget {
  const CustomListBuilder({
    super.key,
    required this.itemCount,
    required this.list,
    required this.startIndex,
    this.leadingIndent,
    required this.returnWidgetType,
    this.padding,
    this.tileMargin,
    this.titleStyle,
    this.skipItemList,
    this.checkStyle,
    this.leadingEndIndent,
    this.separator,
    this.isEnabled,
  });

  final int itemCount;
  final List list;
  final int startIndex;
  final double? leadingIndent;
  final double? leadingEndIndent;
  final Type returnWidgetType;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? tileMargin;
  final TextStyle? titleStyle;
  final List<int>? skipItemList;
  final TextStyle? checkStyle;
  final Widget? separator;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: padding ?? const EdgeInsets.only(top: 0.0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (skipItemList != null && skipItemList!.contains(index)) {
          return const SizedBox.shrink();
        } else {
          if (returnWidgetType == CustomChatBubble) {
            return _buildChatBubble(index);
          } else if (returnWidgetType == ChatTile) {
            return _buildChatTile(index);
          } else if (returnWidgetType == CustomRadioButton) {
            return _buildRadioButton(index);
          } else if (returnWidgetType == CustomCheckBox) {
            return _buildCheckBox(index);
          } else if (returnWidgetType == CountryCodeTile) {
            return _buildCountryCodeTile(index);
          } else if (returnWidgetType == NetworkTile) {
            return _buildNetworkTile(index);
          } else if (returnWidgetType == CustomListTile) {
            return _buildCustomListTile(index, context);
          }
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return separator != null ? separator! : const SizedBox.shrink();
      },
    );
  }

  NetworkTile _buildNetworkTile(int index) {
    return NetworkTile(
      icon: list[index]['leading'],
      title: list[index]['title'],
      subTitleList: list[index]['subTitle'],
      percent: list[index]['percent'],
      dataConsumptionList: list[index]['trailing'],
    );
  }

  CustomCheckBox _buildCheckBox(int index) {
    return CustomCheckBox(
      verticalDensity: 0,
      label: list[index],
      style: checkStyle,
    );
  }

  CountryCodeTile _buildCountryCodeTile(int index) {
    return CountryCodeTile(
      icon: list[index]['icon'],
      title: list[index]['name'],
      subTitle: list[index]['native'],
      code: list[index]['code'],
      isSelected: list[index]['isSelected'],
    );
  }

  CustomRadioButton _buildRadioButton(int index) {
    return CustomRadioButton(
      value: list[index],
      optionsList: list,
      currentOption: list.first,
    );
  }

  CustomListTile _buildCustomListTile(int index, BuildContext context) {
    return CustomListTile(
      onTap: () => NavigationHelper.handle(
        context: context,
        list: list,
        startIndex: startIndex,
        index: index,
      ),
      leadingIndent: leadingIndent,
      leadingEndIndent: leadingEndIndent,
      padding: tileMargin,
      leading: list[index + startIndex]['leading'],
      title: list[index + startIndex]['title'],
      titleStyle: titleStyle,
      subTitle: list[index + startIndex]['subTitle'],
      subTitleIndent: list[index + startIndex]['subTitleIndent'],
      trailing: list[index + startIndex]['trailing'],
      isEnabled: isEnabled ?? list[index + startIndex]['isEnabled'],
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
