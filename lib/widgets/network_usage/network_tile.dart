import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/color_dot.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

import '../../common/linear_percent_indicator.dart';

class NetworkTile extends StatelessWidget {
  const NetworkTile({
    super.key,
    required this.icon,
    required this.title,
    this.subTitleList,
    required this.dataConsumptionList,
    required this.percent,
  });

  final IconData icon;
  final String title;
  final List<String>? subTitleList;
  final double percent;
  final List<String> dataConsumptionList;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      trailingAlignment: Alignment.topRight,
      subTitleIndent: 0,
      leadingIndent: 8.0,
      leadingEndIndent: 40.0,
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, .0, 10.0),
      leading: Icon(icon),
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kTitleTextStyle,
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dataConsumptionList[0],
                style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
              ),
              const ColorDot(
                color: kSecondaryColor,
                radius: 3.0,
              ),
              Text(
                dataConsumptionList[1],
                style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
              ),
            ],
          ),
        ],
      ),
      subTitleWidget: Column(
        children: [
          const SizedBox(height: 5.0),
          CustomLinearPercentIndicator(
            padding: const EdgeInsets.only(left: 0.0),
            height: 4.0,
            percent: percent,
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                subTitleList![0],
                style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
              ),
              const ColorDot(
                color: kSecondaryColor,
                radius: 3.0,
              ),
              Text(
                subTitleList![1],
                style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
