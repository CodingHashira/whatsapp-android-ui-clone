import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.optionsList,
    required this.currentOption,
    this.padding,
    this.leadingIndent,
    this.leadingEndIndent,
  });

  final String value;
  final List optionsList;
  final dynamic currentOption;
  final EdgeInsetsGeometry? padding;
  final double? leadingIndent;
  final double? leadingEndIndent;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIndent: leadingIndent ?? 5.0,
      leadingEndIndent: leadingEndIndent,
      padding: const EdgeInsets.only(top: 0.0),
      leading: Radio(
        activeColor: kAccentColor,
        value: value,
        groupValue: currentOption,
        onChanged: (value) {
          print(value);
        },
      ),
      title: value,
    );
  }
}
