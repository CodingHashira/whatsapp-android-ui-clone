import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

final double screenWidth = Data.screen.width;

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.leading,
    required this.title,
    this.time,
    this.subTitle,
    this.trailingIcon,
  }) : super(key: key);

  final Widget leading;
  final String title;
  final String? time;
  final String? subTitle;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
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
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: kTitleTextStyle,
                    ),
                    if (time != null)
                      Text(
                        time!,
                        style: kTimeTextStyle,
                      ),
                  ],
                ),
                SizedBox(height: subTitle != null ? 3.0 : 0.0),
                subTitle != null
                    ? Row(
                        children: [
                          SizedBox(
                            width: screenWidth - 120,
                            child: subTitle != null
                                ? Text(
                                    subTitle!,
                                    style: kSubTitleTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Icon(trailingIcon),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
