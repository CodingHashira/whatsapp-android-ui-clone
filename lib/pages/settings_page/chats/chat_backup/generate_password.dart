import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/text_field.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class GeneratePasswordPage extends StatelessWidget {
  const GeneratePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: Color(0xff121b22),
        isChildWidget: true,
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: const [
            SizedBox(height: 20.0),
            Text(
              'Create password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80.0),
            CustomTextField(
              hintText: 'Type here',
              autoFocus: true,
              borderColor: kAccentColor,
              borderWidth: 2.0,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(
                'Must contain at least 6 characters and 1 letter',
                style: kSubTitleTextStyle,
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Next',
              // routeName: '',
            ),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
