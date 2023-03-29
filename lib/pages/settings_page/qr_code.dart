import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/settings_page/qr_code/scan_code.dart';
import './qr_code/my_code.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isActionsVisible = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        if (_tabController.index != 0) {
          isActionsVisible = false;
        } else {
          isActionsVisible = true;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 100.0,
          isChildWidget: true,
          title: 'QR code',
          actions: isActionsVisible
              ? SizedBox(
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
                )
              : const SizedBox.shrink(),
          bottom: TabBar(
            labelColor: Colors.white,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text('My code'),
              ),
              Text('Scan code')
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
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
