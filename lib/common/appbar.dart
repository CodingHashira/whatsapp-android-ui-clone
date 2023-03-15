// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.isChildWidget,
    this.imageUrl,
    this.leadingWidth,
    required this.title,
    this.actions,
  });

  final bool isChildWidget;
  final String? imageUrl;
  final double? leadingWidth;
  final String title;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      color: kAppBarColor,
      child: Column(
        children: [
          const SizedBox(height: 45.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isChildWidget
                      ? GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 5.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  imageUrl != null
                      ? CircleAvatar(
                          radius: 18.0,
                          backgroundImage: AssetImage(imageUrl!),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(width: 12.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              actions ?? const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
