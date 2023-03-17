import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.isChildWidget,
    this.imageUrl,
    this.leadingWidth,
    required this.title,
    this.actions,
  }) : super(key: key);

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
          imageUrl != null
              ? const SizedBox(height: 40.0)
              : const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (isChildWidget)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Navigator.pop(context),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 5.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  if (imageUrl != null)
                    CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage(imageUrl!),
                    )
                  else
                    const SizedBox.shrink(),
                  const SizedBox(width: 20.0),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              actions ?? const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
