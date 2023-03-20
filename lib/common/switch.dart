import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: Switch(
        thumbColor:
            switchValue == true ? kThumbActiveColor : kThumbInctiveColor,
        trackColor:
            switchValue == true ? kTrackActiveColor : kTrackInctiveColor,
        value: switchValue,
        onChanged: (p0) => setState(() {
          switchValue = p0;
        }),
      ),
    );
  }
}
