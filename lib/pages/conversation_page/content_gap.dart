import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/divider.dart';

class ContentGap extends StatelessWidget {
  const ContentGap({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: CustomDivider(
        color: const Color(0xff0b141b),
        height: height ?? 12.0,
      ),
    );
  }
}
