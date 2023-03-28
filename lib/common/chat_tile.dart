import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.title,
    this.time,
    this.subTitle,
    this.trailingIcon,
    this.openChat,
    required this.imagePath,
    this.about,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final String? time;
  final String? subTitle;
  final IconData? trailingIcon;
  final bool? openChat;
  final String? about;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomListTile(
      leadingEndIndent: 5.0,
      padding: const EdgeInsets.only(left: 0.0, right: 5.0),
      onTap: openChat == true
          ? () => NavigationHelper.openPage(
                context: context,
                page: ConversationPage(
                  imageUrl: imagePath,
                  userName: title,
                  about: about!,
                ),
              )
          : null,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage(
              imagePath,
            ),
          ),
        ],
      ),
      title: title,
      subTitleWidget: subTitle != null
          ? SizedBox(
              width: screenWidth - 120,
              child: subTitle != null
                  ? Text(
                      subTitle!,
                      style: kSubTitleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox.shrink(),
            )
          : const SizedBox.shrink(),
      trailing: time != null
          ? Column(
              children: [
                const SizedBox(height: 5.0),
                Text(
                  time!,
                  style: kTimeTextStyle,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
