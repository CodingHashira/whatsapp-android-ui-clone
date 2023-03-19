import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Launch Page',
        isChildWidget: false,
      ),
      body: Center(
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          color: kAccentColor,
          onPressed: () => Navigator.pushNamed(context, '/conversationPage'),
          child: const Text(
            'Launch Page',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
