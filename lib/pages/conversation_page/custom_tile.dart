import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIndent: 20.0,
      leadingEndIndent: 20.0,
      leading: Icon(
        icon,
        color: kRedColor,
      ),
      title: title,
      titleStyle: kTitleTextStyle.copyWith(color: kRedColor),
    );
  }
}
