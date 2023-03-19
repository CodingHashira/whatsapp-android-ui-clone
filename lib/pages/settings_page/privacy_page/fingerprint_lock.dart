import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/switch.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/alert_dialogs/call_dialog.dart';

class FingerprintLockPage extends StatelessWidget {
  const FingerprintLockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Fingerprint lock',
      ),
      body: CustomListTile(
        title: 'Unlock with fingerprint',
        subTitle: data.textData['fingerPrintLock']![0],
        subTitleWidthOffset: 90,
        trailingWidget: CustomSwitch(),
      ),
    );
  }
}
