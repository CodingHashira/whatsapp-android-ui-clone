import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        title,
        style: const TextStyle(color: kAccentColor),
      ),
    );
  }
}
