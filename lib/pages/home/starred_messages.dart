import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class StarredMessagesPage extends StatelessWidget {
  const StarredMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Starred messages',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 80.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenWidth / 2.3,
              child: Image.asset(
                'images/starred.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              data.textData['starredMessages']![0],
              style: const TextStyle(
                color: kSecondaryColor,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
