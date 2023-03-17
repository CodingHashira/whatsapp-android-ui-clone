import 'package:flutter/material.dart';

import '../constants.dart';

class PaddedSettingsTextInfo extends StatelessWidget {
  const PaddedSettingsTextInfo({
    super.key,
    required this.text,
    this.padding,
  });

  final String text;
  final EdgeInsetsGeometry? padding;

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
        style: kInfoTextStyle,
      ),
    );
  }
}
