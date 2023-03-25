import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.routeName,
    this.buttonColor,
    this.titleStyle,
    this.onPressed,
  });

  final String title;
  final String? routeName;
  final Color? buttonColor;
  final TextStyle? titleStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: MaterialButton(
        elevation: 0.0,
        disabledTextColor: kDisabledTextColor,
        disabledColor: const Color(0xff1f2c34),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: const BorderSide(color: kTextBoxBorderColor)),
        color: buttonColor ?? const Color(0xff00a884),
        padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 20.0),
        onPressed: routeName != null
            ? routeName != ''
                ? onPressed ?? () => Navigator.pushNamed(context, routeName!)
                : () {}
            : null,
        child: Text(
          title,
          style: titleStyle,
        ),
      ),
    );
  }
}
