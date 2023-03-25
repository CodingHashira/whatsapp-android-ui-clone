import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class HomePageTab extends StatelessWidget {
  const HomePageTab({
    super.key,
    this.title,
    this.icon,
  });

  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: title != null
          ? Text(
              title!,
            )
          : Icon(icon),
    );
  }
}
