import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../../../common/padded_settings_textinfo.dart';
import '../../../constants.dart';

const data = Data();

class SecurityNotificationsPage extends StatelessWidget {
  const SecurityNotificationsPage({super.key});

  static final double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Security Notifications',
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 35.0),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color(0xff0f3633),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock,
                color: Color(0xff06ce9d),
                size: 60,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'End-to-end encryption keeps your personal messages and calls between you and the people you choose. Not even WhatsApp can read or listen to them. This includes your:',
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          CustomListBuilder(
            titleColor: const Color(0xff677077),
            titleSize: 15,
            listTilePadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            itemCount: data.securityNotificationsInfoList.length,
            list: data.securityNotificationsInfoList,
            startIndex: 0,
            returnWidgetType: CustomListTile,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Learn more',
              style: kInfoTextStyle.copyWith(color: kTextLinkColor, height: 1),
            ),
          ),
          const CustomDivider(),
          CustomListTile(
            title: 'Show security notifications on this device',
            subTitleWidget: SizedBox(
              width: screenWidth - 100,
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Get notified when your security code changes for a contact\'s phone in an end-to-end encrypted chat. If you have multiple devices, this setting must be enabled on each device where you want to get notifications.',
                      style: kSubTitleTextStyle,
                    ),
                    TextSpan(
                      text: ' Learn more',
                      style: TextStyle(
                        color: kTextLinkColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            trailingWidget: CustomSwitch(),
          ),
        ],
      ),
    );
  }
}
