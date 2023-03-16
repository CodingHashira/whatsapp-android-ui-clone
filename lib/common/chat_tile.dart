import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.leading,
    required this.title,
    required this.time,
    required this.subTitle,
    this.trailingIcon,
  });

  final Widget leading;
  final String title;
  final String time;
  final String subTitle;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: leading,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: kTitleTextStyle,
                    ),
                    Text(
                      time,
                      style: kTimeTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 3.0),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth - 120,
                      child: Text(
                        subTitle,
                        style: kSubTitleTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(trailingIcon),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
