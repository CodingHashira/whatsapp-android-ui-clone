import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'dart:math';

const data = Data();
final double screenWidth = Data.screen.width;

class GenerateKeyPage extends StatefulWidget {
  const GenerateKeyPage({super.key});

  @override
  State<GenerateKeyPage> createState() => _GenerateKeyPageState();
}

class _GenerateKeyPageState extends State<GenerateKeyPage> {
  bool isHidden = false;
  String buttonTitle = 'Generate your 64-digit key';
  late List<List<String>> securityKeyList;

  List<List<String>> generateKeys() {
    var random = Random();
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
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
    securityKeyList = generateKeys();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateState() => setState(() {
        isHidden = true;
        buttonTitle = 'Continue';
      });

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
              'Your encryption key',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50.0),
            Text(
              data.textData['createEncryption']![3],
              style: kInfoTextStyle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35.0),
            Stack(
              children: [
                GestureDetector(
                  onTap: () => updateState(),
                  child: CustomContainer(
                    isHidden: isHidden,
                    child: Center(
                      child: Text(
                        'Generate your 64-digit key',
                        style: kSubTitleTextStyle.copyWith(color: kAccentColor),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isHidden,
                  child: CustomContainer(
                    isHidden: isHidden,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var row in securityKeyList)
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
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () => updateState(),
                    title: buttonTitle,
                    routeName: '/GenerateKeyPage',
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

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    required this.isHidden,
  });

  final Widget child;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xff182329),
          image: !isHidden
              ? const DecorationImage(
                  scale: 2.0,
                  image: AssetImage(
                    'images/mesh.png',
                  ),
                  fit: BoxFit.cover,
                )
              : null,
          borderRadius: BorderRadius.circular(12.0)),
      height: screenWidth / 2.5,
      // width: double.infinity,
      child: child,
    );
  }
}
