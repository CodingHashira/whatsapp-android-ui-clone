import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class BackupOnPage extends StatelessWidget {
  const BackupOnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
            SizedBox(
              width: screenWidth / 3.2,
              child: Image.asset(
                'images/backup_on.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'End-to-end encrypted backup is on',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40.0),
            Text(
              data.textData['endToEndbackup']![2],
              style: kInfoTextStyle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            Text(
              data.textData['endToEndbackup']![3],
              style: kInfoTextStyle2,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              children: const [
                Expanded(
                  child: CustomButton(
                    title: 'Create password',
                    buttonColor: kPrimaryColor,
                    routeName: '/createEncryptionPage',
                    titleStyle: TextStyle(
                      color: kAccentColor,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: CustomButton(
                    title: 'Turn off',
                    buttonColor: kRedColor,
                    routeName: '/',
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
