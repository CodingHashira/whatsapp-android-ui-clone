import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Launch Page'),
      body: Center(
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          color: kAccentColor,
          onPressed: () => Navigator.pushNamed(context, '/archivedPage'),
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
