import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

const data = Data();

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Invite a friend',
        actions: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTile(
                    leading: Container(
                      decoration: const BoxDecoration(
                        color: kAccentColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    title: 'Share link',
                  ),
                  const PaddedSettingsTextInfo(
                    padding: EdgeInsets.only(left: 20.0, bottom: 15.0),
                    text: 'From Contacts',
                  ),
                  CustomListBuilder(
                    itemCount: data.inviteFriendList.length,
                    list: data.inviteFriendList,
                    startIndex: 0,
                    returnWidgetType: ChatTile,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
