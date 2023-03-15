import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.leading,
    required this.title,
    required this.time,
    required this.subTitle,
    this.trailingIcon,
  });

  final Widget? leading;
  final String title;
  final String time;
  final String subTitle;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          leading != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: leading,
                )
              : Container(),
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
                      width: leading == null
                          ? screenWidth - 55
                          : screenWidth - 120,
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
