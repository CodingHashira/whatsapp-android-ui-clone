import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/home/calls/call_info.dart';
import 'package:ui_flutter_whatsapp/pages/home/calls/create_call_link.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

import '../../model/data.dart';

const data = Data();

class HomeCallsPage extends StatelessWidget {
  const HomeCallsPage({super.key});

  static Widget getIcon({
    required String sender,
    required bool attended,
    double iconSize = 18.0,
  }) {
    if (sender == 'me') {
      return Transform.rotate(
        angle: 3.9,
        child: Icon(
          Icons.arrow_downward,
          color: attended ? Colors.green : kRedColor,
          size: iconSize,
        ),
      );
    } else {
      return Transform.rotate(
        angle: 0.7,
        child: Icon(
          Icons.arrow_downward,
          color: attended ? Colors.green : kRedColor,
          size: iconSize,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'fab',
      //   onPressed: () {},
      //   child: const Icon(Icons.add_ic_call_rounded),
      // ),
      body: ListView(
        children: [
          CustomListTile(
            onTap: () => NavigationHelper.openPage(
              context: context,
              page: const CreateCallLinksPage(),
            ),
            leading: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: kAccentColor,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: 2.4,
                child: const Icon(
                  Icons.link_rounded,
                  color: Colors.white,
                  size: 27.0,
                ),
              ),
            ),
            title: 'Create call link',
            subTitle: 'Share a link for your WhatsApp call',
          ),
          const PaddedSettingsTextInfo(text: 'Recent'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.callHistoryList.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                onTap: () => NavigationHelper.openPage(
                  context: context,
                  page: CallInfoPage(
                    title: data.callHistoryList[index]['title']!,
                    subTitle: data.callHistoryList[index]['subTitle']!,
                    imageUrl: data.callHistoryList[index]['leading']!,
                    sender: data.callHistoryList[index]['sender']!,
                    attended: data.callHistoryList[index]['attended']! == 'yes',
                    about: data.callHistoryList[index]['about']!,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 23.0,
                  backgroundImage: AssetImage(
                    data.callHistoryList[index]['leading']!,
                  ),
                ),
                title: data.callHistoryList[index]['title'],
                titleStyle: kTitleTextStyle.copyWith(
                  fontSize: 16.0,
                ),
                contentPadding: 3.0,
                subTitleWidget: Row(
                  children: [
                    getIcon(
                      sender: data.callHistoryList[index]['sender']!,
                      attended:
                          data.callHistoryList[index]['attended']! == 'yes',
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      data.callHistoryList[index]['subTitle']!,
                      style: kSubTitleTextStyle.copyWith(fontSize: 15.0),
                    )
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    data.callHistoryList[index]['type']! == 'audio'
                        ? Icons.phone_rounded
                        : Icons.videocam,
                    color: kAccentColor,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
