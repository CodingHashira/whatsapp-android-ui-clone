import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.optionsList,
    required this.currentOption,
  });

  final String value;
  final List optionsList;
  final dynamic currentOption;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
      visualDensity: const VisualDensity(horizontal: -2.0, vertical: -2.0),
      activeColor: kAccentColor,
      value: value,
      groupValue: currentOption,
      onChanged: (value) {},
      title: Text(
        value,
        style: kTitleTextStyle,
      ),
    );
  }
}
