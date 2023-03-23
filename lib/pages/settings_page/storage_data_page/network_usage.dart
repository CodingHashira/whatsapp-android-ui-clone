import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/alert_dialogs/reset_network_usage.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';
import 'package:ui_flutter_whatsapp/widgets/network_usage/network_tile.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class NetworkUsagePage extends StatelessWidget {
  const NetworkUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isChildWidget: true, title: 'Network usage'),
      body: ListView(
        children: [
          CustomListTile(
            padding: const EdgeInsets.fromLTRB(60.0, 20.0, 0.0, 20.0),
            title: 'Usage',
            titleStyle: kTitleTextStyle.copyWith(fontSize: 15.0),
            subTitle: 'Since 3/12/23',
            subTitleStyle: kSubTitleTextStyle.copyWith(fontSize: 13.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: const [
                Text(
                  '304.1',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  'MB',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                textBaseline: TextBaseline.ideographic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_upward_rounded,
                        size: 13.0,
                      ),
                      Text(
                        'Sent',
                        style: kSubTitleTextStyle,
                      ),
                    ],
                  ),
                  const Text(
                    '22.9MB',
                    style: kInfoTextStyle2,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_downward_rounded,
                        size: 13.0,
                      ),
                      Text(
                        'Received',
                        style: kSubTitleTextStyle,
                      ),
                    ],
                  ),
                  const Text(
                    '281.1MB',
                    style: kInfoTextStyle2,
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70.0, top: 20.0, bottom: 10.0),
            child: CustomDivider(),
          ),
          CustomListBuilder(
            startIndex: 0,
            tileMargin: const EdgeInsets.symmetric(vertical: 0.0),
            itemCount: data.networkTileList.length,
            list: data.networkTileList,
            returnWidgetType: NetworkTile,
          ),
          const CustomDivider(),
          CustomListTile(
            padding: const EdgeInsets.only(left: 65.0, top: 20.0),
            onTap: () => NavigationHelper.openDialog(
              context: context,
              dialogWidget: const ResetNetworkUsageDialog(),
            ),
            title: 'Reset statistics',
            subTitle: 'Last reset time: 3/12/23, 20:13',
          )
        ],
      ),
    );
  }
}
