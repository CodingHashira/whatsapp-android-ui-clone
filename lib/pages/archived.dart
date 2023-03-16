import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../common/appbar.dart';

const data = Data();

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            isChildWidget: true,
            title: 'Archived',
            actions: CustomPopupMenuButton(
              // popupMenuItems: data.archivedPopupMenuItems,
              popupMenuItems: data.chatPopupMenuItems,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              data.archiveInfo,
              textAlign: TextAlign.center,
              style: kInfoTextStyle,
            ),
          ),
          const Divider(
            color: kDividerColor,
            height: 0.7,
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 0.0),
            shrinkWrap: true,
            itemCount: data.conversaionList.length,
            itemBuilder: ((context, index) {
              return ChatTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(
                    data.conversaionList[index].imageUrl,
                  ),
                ),
                title: data.conversaionList[index].title,
                time: data.conversaionList[index].time,
                subTitle: data.conversaionList[index].subTitle,
              );
            }),
          ),
          const Divider(
            color: kDividerColor,
            height: 0.7,
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                color: kSecondaryColor,
                size: 12.0,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' Your personal messages are ',
                      style: kInfoTextStyle.copyWith(
                        color: const Color(0xff677680),
                        fontSize: 13.0,
                      ),
                    ),
                    TextSpan(
                      text: 'end-to-end encrypted',
                      style: kInfoTextStyle.copyWith(
                        color: kAccentColor,
                        fontSize: 13.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
