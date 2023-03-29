import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class MyCodePage extends StatelessWidget {
  const MyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 320,
                  width: 300,
                  decoration: BoxDecoration(
                    color: kAppBarColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40.0),
                      Text(
                        'Nikhil',
                        style: kTitleTextStyle.copyWith(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'WhatsApp contact',
                        style: kSubTitleTextStyle.copyWith(fontSize: 12.0),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 210.0,
                        width: 210.0,
                        child: Image.asset(
                          'images/qr_whatsapp.jpg',
                          scale: 1.2,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
                Positioned(
                  top: -28,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kAppBarColor, width: 2.2)),
                    child: const CircleAvatar(
                      radius: 24.0,
                      backgroundImage: AssetImage('images/u1.jpg'),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            data.textData['qrCode']![0],
            style: kSubTitleTextStyle.copyWith(fontSize: 15.0),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
