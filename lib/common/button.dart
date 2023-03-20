import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.routeName,
    this.buttonColor,
    this.titleStyle,
  });

  final String title;
  final String? routeName;
  final Color? buttonColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: MaterialButton(
        disabledTextColor: const Color(0xff3c4a55),
        disabledColor: const Color(0xff1f2c34),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        color: buttonColor ?? const Color(0xff00a884),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        onPressed: routeName != null
            ? () => Navigator.pushNamed(context, routeName!)
            : null,
        child: Text(
          title,
          style: titleStyle,
        ),
      ),
    );
  }
}
