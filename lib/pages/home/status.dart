import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/image_view.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class HomeStatusPage extends StatelessWidget {
  const HomeStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('images/p1.jpg'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kAccentColor,
                    border: Border.all(color: kPrimaryColor),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.0,
                  ),
                )
              ],
            ),
            title: const Text(
              'My status',
              style: kTitleTextStyle,
            ),
            subtitle: const Text(
              'Tap to add status update',
              style: kSubTitleTextStyle,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            itemCount: data.statusUpdateList.length,
            itemBuilder: (context, index) {
              var subTitle = data.statusUpdateList[index]['subTitle']!;
              return CustomListTile(
                onTap: () => NavigationHelper.openPage(
                  context: context,
                  page: CustomImageView(
                    imagePath: data.statusUpdateList[index]['statusUrl']!,
                    title: data.statusUpdateList[index]['title']!,
                    uploadTime: data.statusUpdateList[index]['uploadTime'],
                    actionsList: [
                      CustomPopupMenuButton(
                        popupMenuItems: data.statusUpdatePopupOptions,
                      )
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(left: 5.0),
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2.8),
                  ),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage(
                      data.statusUpdateList[index]['statusUrl']!,
                    ),
                  ),
                ),
                title: data.statusUpdateList[index]['title']!,
                subTitle:
                    subTitle.contains(',') ? subTitle : 'Yesterday, $subTitle',
              );
            },
          )
        ],
      ),
    );
  }
}
