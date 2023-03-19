import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';

class ArchiveSettingsPage extends StatelessWidget {
  const ArchiveSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(isChildWidget: true, title: 'Archive Settings'),
      body: CustomListTile(
        title: 'Keep chats archived',
        subTitle:
            'Archived chats will remain archived when you receive a new message',
        trailingWidget: CustomSwitch(),
      ),
    );
  }
}
