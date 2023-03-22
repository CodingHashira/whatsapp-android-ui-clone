import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    this.verticalDensity,
    this.label,
    this.style,
  });

  final double? verticalDensity;
  final String? label;
  final TextStyle? style;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          visualDensity:
              VisualDensity(vertical: widget.verticalDensity ?? -4.0),
          value: checkValue,
          activeColor: kAccentColor,
          checkColor: kPrimaryColor,
          onChanged: (p0) => setState(() {
            checkValue = p0!;
          }),
        ),
        widget.label != null
            ? Expanded(
                child: Text(
                  widget.label!,
                  style: widget.style ?? kSubTitleTextStyle,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
