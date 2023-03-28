import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/alert_dialogs/call_type.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class CreateCallLinksPage extends StatelessWidget {
  const CreateCallLinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isChildWidget: true,
        title: 'Create call link',
        titleStyle: kTitleTextStyle.copyWith(
          color: kSecondaryColor,
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Text(
                  data.textData['createCallLink']![0],
                  style: kInfoTextStyle2.copyWith(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: kAccentColor,
                  child: Icon(
                    Icons.videocam_rounded,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  data.textData['createCallLink']![1],
                  style: kInfoTextStyle2.copyWith(
                    fontSize: 16.0,
                    color: kTextLinkColor,
                  ),
                ),
              ),
              CustomListTile(
                onTap: () => NavigationHelper.openDialog(
                  context: context,
                  dialogWidget: const CallTypeDialog(),
                ),
                padding:
                    const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 25.0),
                leadingIndent: 65.0,
                title: 'Call type',
                subTitle: 'Video',
              ),
              const CustomDivider(),
              const CustomListTile(
                leadingIndent: 15.0,
                leadingEndIndent: 25.0,
                leading: Icon(Icons.forward_rounded),
                title: 'Send link via WhatsApp',
              ),
              const CustomListTile(
                leadingIndent: 15.0,
                leadingEndIndent: 25.0,
                leading: Icon(Icons.copy_rounded),
                title: 'Copy link',
              ),
              const CustomListTile(
                leadingIndent: 15.0,
                leadingEndIndent: 25.0,
                leading: Icon(Icons.share_rounded),
                title: 'Share link',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
