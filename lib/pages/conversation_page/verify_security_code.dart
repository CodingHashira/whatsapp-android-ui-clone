import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class VerifySecurityCodePage extends StatefulWidget {
  const VerifySecurityCodePage({
    super.key,
  });

  @override
  State<VerifySecurityCodePage> createState() => _VerifySecurityCodePageState();
}

class _VerifySecurityCodePageState extends State<VerifySecurityCodePage> {
  bool showBanner = true;
  late List<List<String>> securityNumberList;

  List<List<String>> generateKeys() {
    var random = Random();
    const chars = '0123456789';
    var result = <List<String>>[];

    for (var i = 0; i < 3; i++) {
      var sublist = <String>[];
      for (var j = 0; j < 4; j++) {
        var key = String.fromCharCodes(
          List.generate(
            5,
            (_) => chars.codeUnitAt(
              random.nextInt(chars.length),
            ),
          ),
        );
        sublist.add(key);
      }
      result.add(sublist);
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    securityNumberList = generateKeys();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 70,
        titleStyle: kTitleTextStyle.copyWith(fontSize: 20.0),
        isChildWidget: true,
        titleWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0),
            Text(
              'Verify security code',
              style: kTitleTextStyle.copyWith(fontSize: 17.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              'You, Monica',
              style: kTitleTextStyle.copyWith(fontSize: 12.0),
            )
          ],
        ),
        actions: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.share_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Container(
                      height: screenWidth / 1.8,
                      padding: const EdgeInsets.all(35.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'images/qr_normal.png',
                        width: 160.0,
                      ),
                    ),
                  ],
                ),
              ),
              showBanner
                  ? Container(
                      color: const Color(0xff182329),
                      child: CustomListTile(
                        leadingIndent: 5.0,
                        leading: GestureDetector(
                            onTap: () => setState(() {
                                  showBanner = false;
                                }),
                            child: const Icon(Icons.close_rounded)),
                        subTitle: data.textData['verifySecurityCode']![0],
                        subTitleIndent: 120,
                        trailing: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            'Enable',
                            style: TextStyle(
                              color: kAccentColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        trailingAlignment: Alignment.centerRight,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 40.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var row in securityNumberList)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (var number in row)
                        Text(
                          number,
                          style: kTitleTextStyle.copyWith(
                            color: kSecondaryColor,
                            letterSpacing: 1.5,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    ],
                  )
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          CustomRichText(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            textAlign: TextAlign.center,
            textList: [
              {
                data.textData['verifySecurityCode']![1]: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  height: 1.5,
                ),
                'Learn more': const TextStyle(
                  color: kTextLinkColor,
                  fontSize: 16.0,
                )
              }
            ],
          ),
          const Spacer(),
          Container(
            height: 50.0,
            color: const Color(0xff212e36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Scan code',
                  style: kTitleTextStyle.copyWith(
                    color: kAccentColor,
                  ),
                ),
                const SizedBox(width: 10.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
