import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../common/appbar.dart';
import '../common/popup_menu_button.dart';

final data = Data();

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Archived',
        actions: const [
          CustomPopupMenuButton(),
        ],
      ),
      body: Column(
        children: [
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
            shrinkWrap: true,
            itemCount: data.conversationList.length,
            itemBuilder: ((context, index) {
              return CustomListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage(
                    data.conversationList[index].imageUrl,
                  ),
                ),
                title: data.conversationList[index].title,
                time: data.conversationList[index].time,
                subTitle: data.conversationList[index].subTitle,
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
                size: 15.0,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' Your personal messages are ',
                      style: kInfoTextStyle.copyWith(fontSize: 13.0),
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
