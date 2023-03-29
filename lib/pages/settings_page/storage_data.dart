import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/alert_dialogs/photo_quality.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();
const naviagte = CustomListBuilder;

class StorageDataPage extends StatelessWidget {
  const StorageDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Storage and data',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          CustomListTile(
            onTap: () => Navigator.pushNamed(context, '/manageStoragePage'),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: const Icon(Icons.folder),
            title: 'Manage storage',
            subTitle: '83.1 MB',
          ),
          const CustomDivider(),
          CustomListTile(
            onTap: () => NavigationHelper.openRoute(
              context: context,
              pageRoute: '/networkUsagePage',
            ),
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            leading: const Icon(Icons.network_ping_sharp),
            title: 'Network usage',
            subTitle: '22.9 MB sent • 281.1 MB received',
          ),
          const CustomListTile(
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
            leading: SizedBox(width: 30.0),
            title: 'Use less data for calls',
            trailing: CustomSwitch(),
          ),
          const CustomDivider(),
          const PaddedSettingsTextInfo(text: 'Media auto-download'),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Voice messages are always automatically downloaded',
              style: kSubTitleTextStyle,
            ),
          ),
          CustomListBuilder(
            startIndex: 0,
            tileMargin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            padding: const EdgeInsets.only(left: 20.0, top: 5.0),
            itemCount: data.storageDataOptionList.length,
            list: data.storageDataOptionList,
            returnWidgetType: CustomListTile,
          ),
          const CustomDivider(),
          const PaddedSettingsTextInfo(text: 'Media upload quality'),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Text(
              'Choose the quality Of media files to be sent',
              style: kSubTitleTextStyle,
            ),
          ),
          CustomListTile(
            onTap: () => NavigationHelper.openDialog(
              context: context,
              dialogWidget: const PhotoQualityDialog(),
            ),
            padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 10.0),
            leading: const SizedBox(width: 30.0),
            title: 'Photo upload quality',
            subTitle: 'Auto(recommended)',
          ),
          const CustomDivider(),
          const PaddedSettingsTextInfo(text: 'Proxy'),
          CustomListTile(
            onTap: () => Navigator.pushNamed(context, '/proxySettingsPage'),
            padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
            leading: const SizedBox(width: 30.0),
            title: 'Proxy settings',
            subTitle: 'Off',
          )
        ],
      ),
    );
  }
}
