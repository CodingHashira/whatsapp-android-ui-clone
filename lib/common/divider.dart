import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.indent,
    this.color,
    this.height,
  });

  final double? indent;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      color: color ?? kDividerColor,
      height: 0,
      thickness: height ?? 0.0,
    );
  }
}
