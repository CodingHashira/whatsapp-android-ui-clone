import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:feather_icons/feather_icons.dart';

class BlockedContactsPage extends StatelessWidget {
  const BlockedContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Blocked contacts',
            actions: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.person_add_rounded,
                color: kTextPrimaryColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35.0),
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color(0xff0f3633),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: const [
                Icon(
                  Icons.person_rounded,
                  color: Color(0xff0b8167),
                  size: 80.0,
                ),
                CustomSlashIcon(),
              ],
            ),
          ),
          Text(
            'No blocked contacts',
            style: kInfoTextStyle2.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap the ',
                style: kInfoTextStyle2,
              ),
              const Icon(
                Icons.person_add_rounded,
                size: 22.0,
              ),
              Text(
                ' icon to select a contact to',
                style: kInfoTextStyle2.copyWith(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                maxLines: 2,
              )
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(' block.', style: kInfoTextStyle2)),
          const SizedBox(height: 20.0),
          const CustomDivider(),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Blocked contacts will no longer be able to call you or send you messages.',
              style: kInfoTextStyle.copyWith(height: 1.5),
            ),
          )
        ],
      ),
    );
  }
}

class CustomSlashIcon extends StatelessWidget {
  const CustomSlashIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, right: 10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 22.0,
            width: 22.0,
            decoration: const BoxDecoration(
              color: Color(0xff0f3633),
              shape: BoxShape.circle,
            ),
          ),
          const Icon(
            FeatherIcons.slash,
            color: kAccentColor,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
