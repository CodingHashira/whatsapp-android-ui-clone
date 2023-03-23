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
  });

  final String value;
  final List optionsList;
  final dynamic currentOption;
  final EdgeInsetsGeometry? padding;
  final double? leadingIndent;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIndent: leadingIndent ?? 5.0,
      padding: const EdgeInsets.only(top: 0.0),
      leading: Radio(
        activeColor: kAccentColor,
        value: value,
        groupValue: currentOption,
        onChanged: (value) {},
      ),
      title: value,
    );
  }
}
