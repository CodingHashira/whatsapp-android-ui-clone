import 'package:flutter/material.dart';

import '../../constants.dart';

class MicButton extends StatelessWidget {
  const MicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kAccentColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10.0),
      child: const Icon(
        Icons.mic_rounded,
        color: Colors.white,
      ),
    );
  }
}
