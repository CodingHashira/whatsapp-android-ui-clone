import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.inputType,
  });
  final String? hintText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      cursorColor: kAccentColor,
      style: const TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          height: 1.13,
          color: kSecondaryColor,
          fontSize: 18.0,
        ),
        prefixIcon: const Icon(
          Icons.mood,
          color: kSecondaryColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
