import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    this.color,
    this.onTap,
  });

  final String title;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () => Navigator.pop(context),
      child: Text(
        title,
        style: const TextStyle(color: kAccentColor),
      ),
    );
  }
}
