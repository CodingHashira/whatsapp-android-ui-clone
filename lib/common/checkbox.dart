import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    this.verticalDensity,
    this.label,
    this.style,
    this.onChanged,
    this.checkValue,
    this.isEnabled,
  });

  final double? verticalDensity;
  final String? label;
  final TextStyle? style;
  final Function(bool?)? onChanged;
  final bool? checkValue;
  final bool? isEnabled;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool checkValue;
  late bool isEnabled;

  @override
  void initState() {
    super.initState();
    if (widget.checkValue != null) {
      checkValue = widget.checkValue!;
      isEnabled = widget.isEnabled!;
    } else {
      checkValue = false;
      isEnabled = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          visualDensity:
              VisualDensity(vertical: widget.verticalDensity ?? -4.0),
          value: widget.checkValue ?? checkValue,
          activeColor: kAccentColor,
          checkColor: kPrimaryColor,
          onChanged: widget.isEnabled != false
              ? (p0) => setState(() {
                    checkValue = p0!;
                  })
              : null,
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
