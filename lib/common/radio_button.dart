import 'package:flutter/material.dart';

import '../constants.dart';
import 'list_tile.dart';

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
    return CustomListTile(
      padding: const EdgeInsets.all(0),
      leadingWidth: 0.0,
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
