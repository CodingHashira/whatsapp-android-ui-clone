import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/qr_code/scan_code.dart';
import './qr_code/my_code.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 100.0,
          isChildWidget: true,
          title: 'QR code',
          actions: SizedBox(
            width: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.share_rounded),
                CustomPopupMenuButton(
                  popupMenuItems: {
                    'Reset QR code': '',
                  },
                  popButtonSize: 23.0,
                  popButtonColor: kSecondaryColor,
                )
              ],
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('My code'),
              ),
              Text('Scan code')
            ],
          ),
        ),
        body: Column(
          children: const [
            Expanded(
              child: TabBarView(
                children: [
                  MyCodePage(),
                  ScanCodePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
