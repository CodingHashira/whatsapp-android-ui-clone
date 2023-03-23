import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  const MyTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      height: 45.0,
    );
  }
}
