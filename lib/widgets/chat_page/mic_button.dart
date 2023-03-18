import 'package:flutter/material.dart';

import '../../constants.dart';

class MicButton extends StatelessWidget {
  const MicButton({
    super.key,
    required this.iconSize,
    required this.padding,
  });

  final double iconSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kAccentColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(padding),
      child: Icon(
        Icons.mic_rounded,
        size: iconSize,
        color: Colors.white,
      ),
    );
  }
}
