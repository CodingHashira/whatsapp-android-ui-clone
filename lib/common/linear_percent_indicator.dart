import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  const CustomLinearPercentIndicator({
    super.key,
    required this.height,
    required this.percent,
    this.color,
    this.padding,
  });

  final double height;
  final double percent;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10.0),
      progressColor: color ?? kAccentColor,
      backgroundColor: const Color(0xff182329),
      animation: true,
      lineHeight: height,
      percent: percent,
      barRadius: const Radius.circular(12.0),
    );
  }
}
