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
      leading: Icon(icon),
      leadingWidth: 20.0,
      leadingAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.fromLTRB(15.0, 12.0, 25.0, 12.0),
      title: title,
      subTitleWidget: Column(
        children: [
          const SizedBox(height: 5.0),
          CustomLinearPercentIndicator(
            padding: const EdgeInsets.only(left: 0.0),
            height: 3.2,
            percent: percent,
          ),
          const SizedBox(height: 10.0),
          subTitleList != null
              ? Row(
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
                )
              : const SizedBox.shrink(),
        ],
      ),
      trailing: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          const Icon(
            Icons.arrow_upward_rounded,
            size: 13.0,
          ),
          Text(
            dataConsumptionList[0],
            style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
          ),
          const SizedBox(width: 5.0),
          const Icon(
            Icons.arrow_downward_rounded,
            size: 13.0,
          ),
          Text(
            dataConsumptionList[1],
            style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
          ),
        ],
      ),
      // trailingMaxWidth: 130.0, //TODO: remove unnecessary listTile prop
    );
  }
}
