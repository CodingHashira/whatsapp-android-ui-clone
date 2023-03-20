import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import '../privacy_page/live_location.dart';

const data = Data();

class RequestAccountInfoPage extends StatefulWidget {
  const RequestAccountInfoPage({super.key});

  @override
  State<RequestAccountInfoPage> createState() => _RequestAccountInfoPageState();
}

class _RequestAccountInfoPageState extends State<RequestAccountInfoPage> {
  bool isRequested = false;

  String getReadyDate() {
    DateTime date = DateTime.now();
    DateTime oneWeekLater = date.add(const Duration(days: 3));
    String month = DateFormat('MMMM').format(oneWeekLater);
    String day = DateFormat('d').format(oneWeekLater);
    String year = DateFormat('y').format(oneWeekLater);
    return 'Ready by $month $day, $year';
  }

  void updateSelection() => setState(() {
        if (!isRequested) isRequested = true;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Request Account Info',
      ),
      body: Column(
        children: [
          const CustomImageContainer(
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            imageUrl: 'images/account_info.jpg',
            width: 65,
            paddingValue: 23,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
            child: CustomRichText(
              textList: [
                {
                  data.textData['requestAccountInfo']![0]:
                      kInfoTextStyle2.copyWith(height: 1.5),
                  ' Learn more':
                      kInfoTextStyle2.copyWith(color: kTextLinkColor),
                }
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const CustomDivider(),
          CustomListTile(
            onTap: updateSelection,
            leading: isRequested
                ? const Icon(Icons.schedule_rounded)
                : const Icon(Icons.description_rounded),
            title: 'Request report',
            subTitleWidget: Visibility(
              visible: isRequested,
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  getReadyDate(),
                  style: kSubTitleTextStyle,
                ),
              ),
            ),
          ),
          const CustomDivider(),
          const SizedBox(height: 10.0),
          Visibility(
            visible: isRequested,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Text(
                    data.textData['requestAccountInfo']![1],
                    style: kInfoTextStyle,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data.textData['requestAccountInfo']![2],
                    style: kInfoTextStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
