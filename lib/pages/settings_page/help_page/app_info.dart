import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
            image: const AssetImage(
              'images/info_page_bg.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WhatsApp Messenger',
              style: kInfoTextStyle2.copyWith(fontSize: 22.0),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'Version 2.23.6.20 (Beta)',
              style: TextStyle(
                color: Color(0xff86a9a7),
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 18.0),
            Image.asset('images/whatsapp.png'),
            const SizedBox(height: 18.0),
            Text(
              '© 2010-2023 WhatsApp Inc.',
              style: kInfoTextStyle2.copyWith(
                color: const Color(0xff86a9a7),
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 25.0),
            const CustomButton(
              title: 'Licenses',
              titleStyle: TextStyle(
                fontSize: 16.0,
              ),
              routeName: '/LicensesPage',
            )
          ],
        ),
      ),
    );
  }
}
