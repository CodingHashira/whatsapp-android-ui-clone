import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/text_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class ContactAcessPage extends StatelessWidget {
  const ContactAcessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kAppBarColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      content: SizedBox(
        height: 310.0,
        width: screenWidth - 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff00a884),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
              ),
              height: 120.0,
              child: Center(
                child: SizedBox(
                  width: screenWidth / 6.5,
                  child: Image.asset(
                    'images/contact_access.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, top: 20.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contacts',
                    style: kSubTitleTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    data.textData['contactAccess']![0],
                    style: kSubTitleTextStyle.copyWith(
                      color: Colors.grey.shade300,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CustomTextButton(title: 'Not now'),
                      CustomTextButton(title: 'Continue'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
