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

class NetworkUsagePage extends StatelessWidget {
  const NetworkUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isChildWidget: true, title: 'Network usage'),
      body: ListView(
        shrinkWrap: true,
        children: [
          const CustomListTile(
            padding: EdgeInsets.fromLTRB(55.0, 15.0, 0.0, 0.0),
            title: 'Usage',
            subTitle: 'Since 3/12/23',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70.0, 10.0, 0.0, 25.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              TransmittedDataText(
                dataSize: '22.9MB',
                dataType: DataType.sent,
              ),
              TransmittedDataText(
                dataSize: '281.1MB',
                dataType: DataType.received,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70.0, top: 20.0, bottom: 5.0),
            child: CustomDivider(),
          ),
          CustomListBuilder(
            startIndex: 0,
            tileMargin: const EdgeInsets.symmetric(vertical: 0.0),
            itemCount: data.networkTileList.length,
            list: data.networkTileList,
            returnWidgetType: NetworkTile,
          ),
          const SizedBox(height: 5.0),
          const CustomDivider(),
          CustomListTile(
            padding: const EdgeInsets.only(left: 55, top: 5.0),
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

enum DataType {
  sent,
  received,
}

class TransmittedDataText extends StatelessWidget {
  const TransmittedDataText({
    super.key,
    required this.dataType,
    required this.dataSize,
  });

  final DataType dataType;
  final String dataSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          children: [
            Icon(
              dataType == DataType.sent
                  ? Icons.arrow_upward_rounded
                  : Icons.arrow_downward_rounded,
              size: 13.0,
            ),
            Text(
              dataType == DataType.sent ? ' Sent' : ' Received',
              style: kSubTitleTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Text(
            dataSize,
            style: kInfoTextStyle2,
          ),
        )
      ],
    );
  }
}
