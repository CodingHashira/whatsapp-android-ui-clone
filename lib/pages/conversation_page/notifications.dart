import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/checkbox.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class ConversationNotificationsPage extends StatefulWidget {
  const ConversationNotificationsPage({super.key});

  @override
  State<ConversationNotificationsPage> createState() =>
      _ConversationNotificationsPageState();
}

class _ConversationNotificationsPageState
    extends State<ConversationNotificationsPage> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    void updateValue() => setState(() {
          isEnabled = !isEnabled;
        });

    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Notifications',
        actions: CustomPopupMenuButton(
          popupMenuItems: {
            'Reset notification settings': '',
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Use custom ntifications',
                  style: kTitleTextStyle,
                ),
                Checkbox(
                  activeColor: kAccentColor,
                  checkColor: kPrimaryColor,
                  value: isEnabled,
                  onChanged: (p0) => updateValue(),
                )
              ],
            ),
          ),
          const PaddedSettingsTextInfo(text: 'Message notifications'),
          CustomListBuilder(
            isEnabled: isEnabled,
            itemCount: 5,
            list: data.coversationNotificationOptionsList,
            startIndex: 0,
            returnWidgetType: CustomListTile,
            separator: const CustomDivider(),
          ),
          const PaddedSettingsTextInfo(text: 'Message notifications'),
          CustomListBuilder(
            isEnabled: isEnabled,
            itemCount: 2,
            list: data.coversationNotificationOptionsList,
            startIndex: 5,
            returnWidgetType: CustomListTile,
            separator: const CustomDivider(),
          ),
        ],
      ),
    );
  }
}
