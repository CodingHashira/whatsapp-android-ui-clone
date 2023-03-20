import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool checkValue = true;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: const VisualDensity(vertical: -4),
      value: checkValue,
      activeColor: kAccentColor,
      checkColor: kPrimaryColor,
      onChanged: (p0) => setState(() {
        checkValue = p0!;
      }),
    );
  }
}
