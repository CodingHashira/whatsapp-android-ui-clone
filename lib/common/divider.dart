import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kDividerColor,
      height: 0.7,
    );
  }
}
