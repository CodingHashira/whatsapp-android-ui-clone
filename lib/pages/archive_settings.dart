import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';

import '../common/list_tile.dart';

const String info =
    'Archived chats will remain archived when you receive a new message';

class ArchiveSettingsPage extends StatelessWidget {
  const ArchiveSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(isChildWidget: true, title: 'Archive Settings'),
          CustomListTile(
            title: 'Keep chats archived',
            subTitle: info,
            trailingWidget: CustomSwitch(),
          ),
        ],
      ),
    );
  }
}
