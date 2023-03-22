import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class CreateEncryptionPage extends StatelessWidget {
  const CreateEncryptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: Color(0xff121b22),
        isChildWidget: true,
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'End-to-end encrytion backup',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60.0),
            Transform.rotate(
              angle: 0.7,
              child: const Icon(
                Icons.key_rounded,
                color: kAccentColor,
                size: 40.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              data.textData['createEncryption']![0],
              style: kInfoTextStyle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60.0),
            const Icon(
              Icons.warning_rounded,
              color: kRedColor,
              size: 40.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              data.textData['createEncryption']![1],
              style: kInfoTextStyle2,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              children: const [
                Expanded(
                  child: CustomButton(
                    title: 'Create password',
                    routeName: '/generatePasswordPage',
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: CustomButton(
                    buttonColor: kPrimaryColor,
                    title: 'Use 64-digit encryption key instead',
                    titleStyle: TextStyle(
                      color: kAccentColor,
                      fontSize: 15.0,
                    ),
                    routeName: '/generateKeyPage',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
