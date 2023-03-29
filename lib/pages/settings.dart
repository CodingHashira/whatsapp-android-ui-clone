import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/qr_code.dart';

const data = Data();

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Settings',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            onTap: () => NavigationHelper.openRoute(
              context: context,
              pageRoute: '/profilePage',
            ),
            minVerticalPadding: 20.0,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            leading: GestureDetector(
              child: const Hero(
                tag: 'profileImage',
                child: CircleAvatar(
                  radius: 32.0,
                  backgroundImage: AssetImage('images/u1.jpg'),
                ),
              ),
            ),
            title: Text(
              'Nikhil',
              style: kTitleTextStyle.copyWith(fontSize: 18.0),
            ),
            subtitle: const Text(
              'Urgent calls only',
              style: kSubTitleTextStyle,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => NavigationHelper.openPage(
                    context: context,
                    page: const QrCodePage(),
                  ),
                  child: const Icon(
                    Icons.qr_code_rounded,
                    color: kAccentColor,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const CustomDivider(),
          CustomListBuilder(
            startIndex: 0,
            tileMargin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            itemCount: data.settingsMenu.length,
            leadingIndent: 10.0,
            leadingEndIndent: 40.0,
            list: data.settingsMenu,
            returnWidgetType: CustomListTile,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'from',
                    style: kInfoTextStyle.copyWith(
                      fontSize: 13.0,
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Row(
                    children: [
                      Image.asset(
                        'images/meta.png',
                        width: 15.0,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        'Meta',
                        style: kSubTitleTextStyle.copyWith(
                          color: const Color(0xffc7c8ca),
                          fontSize: 13.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
