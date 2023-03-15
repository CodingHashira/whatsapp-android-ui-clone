import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/chat_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

import '../common/list_tile.dart';

const String info =
    'Archived chats will remain archived when you receive a new message';

class ArchiveSettingsPage extends StatelessWidget {
  const ArchiveSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Archive Settings'),
      body: Column(
        children: [
          CustomListTile(
            title: 'Keep chats archived',
            subTitle: info,
            trailingWidget: Switch(
              activeColor: kAccentColor,
              value: true,
              onChanged: (p0) {},
            ),
          ),
        ],
      ),
    );
  }
}
