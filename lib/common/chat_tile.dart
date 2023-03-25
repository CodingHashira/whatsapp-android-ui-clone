import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

final double screenWidth = Data.screen.width;

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.title,
    this.time,
    this.subTitle,
    this.trailingIcon,
    this.openChat,
    required this.imagePath,
    required this.about,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final String? time;
  final String? subTitle;
  final IconData? trailingIcon;
  final bool? openChat;
  final String about;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: openChat == true
          ? () => NavigationHelper.openPage(
                context: context,
                page: ConversationPage(
                  imageUrl: imagePath,
                  userName: title,
                  about: about,
                ),
              )
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                radius: 23.0,
                backgroundColor: const Color.fromARGB(255, 78, 95, 105),
                backgroundImage: AssetImage(
                  imagePath,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: kTitleTextStyle,
                      ),
                      if (time != null)
                        Text(
                          time!,
                          style: kTimeTextStyle,
                        ),
                    ],
                  ),
                  SizedBox(height: subTitle != null ? 3.0 : 0.0),
                  subTitle != null
                      ? Row(
                          children: [
                            SizedBox(
                              width: screenWidth - 120,
                              child: subTitle != null
                                  ? Text(
                                      subTitle!,
                                      style: kSubTitleTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            Icon(trailingIcon),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
