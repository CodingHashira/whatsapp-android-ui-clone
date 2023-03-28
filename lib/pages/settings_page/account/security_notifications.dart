import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';

const data = Data();

class SecurityNotificationsPage extends StatelessWidget {
  const SecurityNotificationsPage({super.key});

  static final double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
              data.textData['securityNotifications']![0],
              style: kInfoTextStyle.copyWith(
                color: const Color(0xff677077),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          ListView.separated(
            padding: const EdgeInsets.only(left: 22.0),
            itemCount: data.notificationsOptionList.length - 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  data.securityNotificationsInfoList[index]['leading']
                      as Widget,
                  const SizedBox(width: 10.0),
                  Text(
                    data.securityNotificationsInfoList[index]['title']
                        as String,
                    style: kSubTitleTextStyle.copyWith(
                      fontSize: 14.0,
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8.0);
            },
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
              child: CustomRichText(
                textList: [
                  {
                    data.textData['securityNotifications']![1]:
                        kSubTitleTextStyle,
                    ' Learn more': const TextStyle(color: kTextLinkColor),
                  }
                ],
              ),
            ),
            trailing: const CustomSwitch(),
          ),
        ],
      ),
    );
  }
}
