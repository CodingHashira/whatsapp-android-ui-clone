import 'package:flutter/cupertino.dart';

import '../constants.dart';

class CustomPopupMenuItem extends StatelessWidget {
  const CustomPopupMenuItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: kTextPrimaryColor,
        ),
      ),
    );
  }
}
