import 'package:flutter/material.dart';

import './button_bar_ite.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/rupee_icon.dart';

class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButtonBarItem(
            icon: Icons.phone_rounded,
            label: 'Audio',
          ),
          CustomButtonBarItem(
            icon: Icons.videocam_rounded,
            label: 'Video',
          ),
          CustomButtonBarItem(
            widget: Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: RupeeIcon(
                iconSize: 20.0,
                color: kAccentColor,
                padding: EdgeInsets.all(2.0),
              ),
            ),
            label: 'Pay',
          ),
          CustomButtonBarItem(
            icon: Icons.search_rounded,
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
