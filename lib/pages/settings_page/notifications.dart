import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Notifications',
        actions: CustomPopupMenuButton(
          popupMenuItems: {'Reset notification settings': '/testPage'},
        ),
      ),
      body: ListView(
        children: [
          const CustomListTile(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
            title: 'Conversatioon tones',
            subTitle: 'Play sounds for incoming and outgoing messages.',
            subTitleIndent: 90.0,
            trailing: CustomSwitch(),
          ),
          const CustomDivider(),
          const PaddedSettingsTextInfo(text: 'Messages'),
          CustomListBuilder(
            startIndex: 0,
            itemCount: data.notificationsOptionList.length,
            list: data.notificationsOptionList,
            returnWidgetType: CustomListTile,
          ),
          const SizedBox(height: 10.0),
          const CustomDivider(),
          const SizedBox(height: 5.0),
          const PaddedSettingsTextInfo(text: 'Groups'),
          CustomListBuilder(
            startIndex: 0,
            itemCount: data.notificationsOptionList.length,
            list: data.notificationsOptionList,
            returnWidgetType: CustomListTile,
            skipItemList: const [2],
          ),
          const CustomDivider(),
          CustomListBuilder(
            startIndex: 0,
            itemCount: data.notificationsOptionListTwo.length,
            list: data.notificationsOptionListTwo,
            returnWidgetType: CustomListTile,
          ),
        ],
      ),
    );
  }
}
