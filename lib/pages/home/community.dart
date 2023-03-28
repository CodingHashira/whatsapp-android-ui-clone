import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class HomeCommunityPage extends StatelessWidget {
  const HomeCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 7, vertical: 20.0),
              child: Image.asset(
                'images/community.png',
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              'Introducing communities',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              data.textData['community']![0],
              style: kInfoTextStyle2.copyWith(
                color: kSecondaryColor,
                fontSize: 16.0,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              child: Row(
                children: const [
                  Expanded(
                    child: CustomButton(
                      title: 'Start your community',
                      routeName: '/',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
