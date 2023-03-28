import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class LiveLocationPage extends StatelessWidget {
  const LiveLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Live location',
      ),
      body: Column(
        children: [
          const CustomImageContainer(
            imageUrl: 'images/location.jpg',
            width: 72,
            paddingValue: 20,
          ),
          const Text(
            'You aren\'t sharing live location in any chats',
            style: kInfoTextStyle2,
          ),
          const SizedBox(height: 15.0),
          const CustomDivider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text(
              data.textData['liveLocation']![0],
              style: kInfoTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    super.key,
    required this.imageUrl,
    this.width,
    required this.paddingValue,
    this.margin,
  });

  final String imageUrl;
  final double? width;
  final double paddingValue;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 35.0),
      padding: EdgeInsets.all(paddingValue),
      decoration: const BoxDecoration(
        color: Color(0xff0f3633),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        imageUrl,
        width: width,
      ),
    );
  }
}
