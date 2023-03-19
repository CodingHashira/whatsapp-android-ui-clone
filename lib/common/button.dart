import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.routeName,
    this.buttonColor,
  });

  final String title;
  final String? routeName;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          routeName != null ? Navigator.pushNamed(context, routeName!) : null,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: buttonColor ?? const Color(0xff00a884),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          onPressed: () {},
          child: Text(
            title,
            style: const TextStyle(
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
