import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class PaddedSettingsTextInfo extends StatelessWidget {
  const PaddedSettingsTextInfo({
    super.key,
    required this.text,
    this.padding,
    this.textStyle,
    this.textAlign,
  });

  final String text;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding != null
          ? padding!
          : const EdgeInsets.only(
              left: 20.0,
              top: 20.0,
              right: 20.0,
              bottom: 5.0,
            ),
      child: Text(
        text,
        style: textStyle ?? kInfoTextStyle,
        textAlign: textAlign,
      ),
    );
  }
}
