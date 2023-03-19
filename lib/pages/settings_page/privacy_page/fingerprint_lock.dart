import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';

import '../../../common/list_tile.dart';
import '../../../common/switch.dart';

const String info =
    'When enabled, you\'ll need to use fingerprint to open WhatsApp. You can still answer calls if WhatsApp is locked.';

class FingerprintLockPage extends StatelessWidget {
  const FingerprintLockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(isChildWidget: true, title: 'Fingerprint lock'),
          CustomListTile(
            title: 'Unlock with fingerprint',
            subTitle: info,
            subTitleWidthOffset: 90,
            trailingWidget: CustomSwitch(),
          ),
        ],
      ),
    );
  }
}
