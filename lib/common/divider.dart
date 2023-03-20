import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.indent,
  });

  final double? indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      color: kDividerColor,
      height: 0,
    );
  }
}
