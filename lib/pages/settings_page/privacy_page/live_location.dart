import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';

import '../../../constants.dart';

class LiveLocationPage extends StatelessWidget {
  const LiveLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(
            isChildWidget: true,
            title: 'Live location',
          ),
          CustomImageContainer(
            imageUrl: 'images/location.jpg',
            width: 72,
            paddingValue: 20,
          ),
          Text(
            'You aren\'t sharing live location in any chats',
            style: kInfoTextStyle2,
          ),
          SizedBox(height: 15.0),
          CustomDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text(
              'Live location requires background location. You can manage this in your device settings.',
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
    return Stack(
      // TODO: Remove after scaling
      alignment: Alignment.center,
      children: [
        Container(
          margin: margin ?? const EdgeInsets.symmetric(vertical: 35.0),
          height: 110,
          width: 110,
          decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
          ),
        ),
        Container(
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
        ),
      ],
    );
  }
}
