import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomButtonBarItem extends StatelessWidget {
  const CustomButtonBarItem({
    super.key,
    this.widget,
    required this.label,
    this.icon,
  });
  final IconData? icon;
  final Widget? widget;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget != null ? widget! : const SizedBox.shrink(),
        icon != null
            ? Icon(
                icon!,
                color: kAccentColor,
                size: 28.0,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 10.0),
        Text(
          label,
          style: kTitleTextStyle.copyWith(
            color: kAccentColor,
            fontSize: 15.0,
          ),
        )
      ],
    );
  }
}
