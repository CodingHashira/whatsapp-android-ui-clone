import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class ChatBackupPage extends StatelessWidget {
  const ChatBackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Chat backup',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            leadingAlignment: CrossAxisAlignment.start,
            leading: const Icon(Icons.cloud_upload_rounded),
            title: 'Last Backup',
            titleStyle: kSubTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
            subTitle: data.textData['chatBackup']![0],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(text: 'Local 08:10'),
                CustomText(text: 'Google Drive: 12/26/22, 10:22'),
                CustomText(text: 'Size: 122 MB'),
                SizedBox(height: 15.0),
                CustomButton(
                  title: 'Backup',
                  routeName: '',
                )
              ],
            ),
          ),
          const CustomListTile(
            leadingAlignment: CrossAxisAlignment.start,
            leading: Icon(Icons.lock_rounded),
            title: 'End-to-end encrypted backup',
            subTitle: 'On',
          ),
          const CustomDivider(),
          CustomListTile(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            leadingAlignment: CrossAxisAlignment.start,
            leading: const Icon(Icons.add_to_drive_rounded),
            title: 'Last Backup',
            titleStyle: kSubTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
            subTitle: data.textData['chatBackup']![1],
            subTitleIndent: 80.0,
          ),
          CustomListBuilder(
            startIndex: 0,
            itemCount: data.chatBackupOptionsList.length,
            list: data.chatBackupOptionsList,
            returnWidgetType: CustomListTile,
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        height: 1.6,
      ),
    );
  }
}
