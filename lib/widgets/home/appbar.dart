import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class LaunchPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LaunchPageAppBar({
    Key? key,
    required this.title,
    required this.bottom,
  }) : super(key: key);

  final String title;
  final PreferredSizeWidget bottom;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        'WhatsApp',
        style: kTitleTextStyle.copyWith(
          color: kSecondaryColor,
          fontSize: 20.0,
        ),
      ),
      actions: [
        Container(
          width: 120,
          padding: const EdgeInsets.only(right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: kSecondaryColor,
              ),
              const SizedBox(),
              const Icon(
                Icons.search,
                color: kSecondaryColor,
              ),
              CustomPopupMenuButton(
                popupMenuItems: data.homePagePopUpMenuOptions,
                popButtonColor: kSecondaryColor,
              )
            ],
          ),
        )
      ],
      bottom: bottom,
    );
  }
}
