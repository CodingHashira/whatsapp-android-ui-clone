import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No links found',
          style: kInfoTextStyle2.copyWith(
            color: const Color(0xffe8edf0),
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
