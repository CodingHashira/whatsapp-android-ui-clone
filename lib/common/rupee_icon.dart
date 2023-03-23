import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class RupeeIcon extends StatelessWidget {
  const RupeeIcon({
    super.key,
    this.iconSize,
    this.padding,
    this.color,
  });

  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(2.8),
      decoration: BoxDecoration(
        color: color ?? kSecondaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.currency_rupee_rounded,
        color: kPrimaryColor,
        size: iconSize ?? 14.0,
      ),
    );
  }
}
