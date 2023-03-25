import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/conversation_about.dart';
import 'package:ui_flutter_whatsapp/pages/home/calls.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class CallInfoPage extends StatelessWidget {
  const CallInfoPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.sender,
    required this.attended,
    required this.about,
  });

  final String title;
  final String subTitle;
  final String imageUrl;
  final String sender;
  final bool attended;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isChildWidget: true,
        title: 'Call info',
        actions: SizedBox(
          width: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => NavigationHelper.openPage(
                  context: context,
                  page: ConversationAboutPage(
                    title: title,
                    imageUrl: imageUrl,
                    about: about,
                  ),
                ),
                child: const Icon(
                  Icons.chat_rounded,
                  size: 25.0,
                ),
              ),
              CustomPopupMenuButton(
                popupMenuItems: data.callInfoPopupMenuOptions,
                popButtonColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(imageUrl),
            ),
            title: title,
            subTitle: about,
            trailing: SizedBox(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.phone_rounded,
                    color: kAccentColor,
                  ),
                  Icon(
                    Icons.videocam_rounded,
                    color: kAccentColor,
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80.0),
            child: CustomDivider(),
          ),
          PaddedSettingsTextInfo(
            padding: const EdgeInsets.fromLTRB(80.0, 10.0, 0.0, 20.0),
            text: subTitle.contains(',') ? subTitle.split(',')[0] : 'Yesterday',
          ),
          CustomListTile(
            leadingAlignment: CrossAxisAlignment.start,
            leadingIndent: 25.0,
            leadingEndIndent: 20.0,
            leading: HomeCallsPage.getIcon(
              sender: sender,
              attended: attended,
              iconSize: 27.0,
            ),
            title: sender == 'me' ? 'Outgoing' : 'Incoming',
            subTitle:
                subTitle.contains(',') ? subTitle.split(',')[0] : subTitle,
            trailing: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                attended ? 'Answered' : 'Not answered',
                style: kSubTitleTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
