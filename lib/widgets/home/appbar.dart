import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/alert_dialogs/clear_call_logs.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class LaunchPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  LaunchPageAppBar({
    Key? key,
    required this.title,
    required this.bottom,
    required this.tabIndex,
  }) : super(key: key);

  final String title;
  final PreferredSizeWidget bottom;
  final int tabIndex;

  var toolBarHeight = 100.0;

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);

  @override
  State<LaunchPageAppBar> createState() => _LaunchPageAppBarState();
}

class _LaunchPageAppBarState extends State<LaunchPageAppBar> {
  List<Map<String, dynamic>> popUpActionsList = [
    {'Settings': '/settingsPage'},
    data.homePagePopUpMenuOptions,
    {
      'Status privacy': '/statusPrivacyPage',
      'Settings': '/settingsPage',
    },
    {
      'Clear call log': const ClearCallLogsDialog(),
      'Settings': '/settingsPage',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leadingWidth: 0.0,
      leading: const SizedBox.shrink(),
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          'WhatsApp',
          style: kTitleTextStyle.copyWith(
            color: kSecondaryColor,
            fontSize: 20.0,
          ),
        ),
      ),
      actions: [
        Container(
          width: widget.tabIndex != 0 ? 120 : 70,
          padding: const EdgeInsets.only(right: 5.0, top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: kSecondaryColor,
              ),
              widget.tabIndex != 0
                  ? GestureDetector(
                      onTap: () => setState(() {
                        widget.toolBarHeight = 150.0;
                      }),
                      child: const Icon(
                        Icons.search,
                        color: kSecondaryColor,
                      ),
                    )
                  : const SizedBox.shrink(),
              CustomPopupMenuButton(
                popupMenuItems: popUpActionsList[widget.tabIndex],
                popButtonColor: kSecondaryColor,
              )
            ],
          ),
        )
      ],
      bottom: widget.bottom,
    );
  }
}
