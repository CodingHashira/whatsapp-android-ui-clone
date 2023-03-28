import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ui_flutter_whatsapp/alert_dialogs/contact_access.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/launch_page/profile_info.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class AccountInitilizationPage extends StatefulWidget {
  const AccountInitilizationPage({super.key});

  @override
  State<AccountInitilizationPage> createState() =>
      _AccountInitilizationPageState();
}

class _AccountInitilizationPageState extends State<AccountInitilizationPage> {
  Future<void> loadHomeScreenWithDelay() async {
    int counter = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      counter++;

      if (counter == 5) {
        NavigationHelper.openPage(
          context: context,
          page: const ProfileInfoPage(),
        );

        NavigationHelper.openDialog(
          context: context,
          dialogWidget: const ContactAcessPage(),
        );

        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadHomeScreenWithDelay();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: kAppBarColor,
              height: 35.0,
            ),
            const SizedBox(height: 50.0),
            Text(
              'Initializing...',
              style: kTitleTextStyle.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Please wait a moment',
              style: kSubTitleTextStyle.copyWith(
                fontSize: 13.0,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: screenWidth / 1.4,
              child: Image.asset(
                'images/doodle.png',
                isAntiAlias: true,
                color: kAccentColor,
                fit: BoxFit.fitHeight,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              color: kAccentColor,
            ),
            const SizedBox(height: 70.0),
          ],
        ),
      ),
    );
  }
}
