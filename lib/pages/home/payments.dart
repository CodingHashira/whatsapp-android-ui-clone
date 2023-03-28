import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';

import '../../common/appbar.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/common/rupee_icon.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/conversation_page/content_gap.dart';

const data = Data();

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Payments',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomListTile(
            padding: EdgeInsets.only(left: 5.0, top: 5.0),
            leading: RupeeIcon(
              color: kAccentColor,
            ),
            title: 'Send payment',
          ),
          const CustomListTile(
            padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
            leading: Icon(
              Icons.qr_code_rounded,
              color: kAccentColor,
            ),
            title: 'Scan payment QR code',
          ),
          const ContentGap(),
          PaddedSettingsTextInfo(
            text: 'History',
            textStyle: kSubTitleTextStyle.copyWith(
              color: kAccentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Image.asset(
              'images/bill.png',
              // height: 90,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20.0),
          const Center(
            child: Text(
              'No payment history',
              style: kSubTitleTextStyle,
            ),
          ),
          const SizedBox(height: 25.0),
          const ContentGap(),
          PaddedSettingsTextInfo(
            text: 'Payment methods',
            textStyle: kSubTitleTextStyle.copyWith(
              color: kAccentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomListTile(
            tileColor: Colors.blueGrey.shade900,
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            leadingIndent: 5.0,
            leading: Stack(
              alignment: Alignment.center,
              children: const [
                Icon(
                  Icons.shield_rounded,
                  color: kAccentColor,
                  size: 30.0,
                ),
                Icon(
                  Icons.lock_rounded,
                  color: kPrimaryColor,
                  size: 15.0,
                ),
              ],
            ),
            subTitleWidget: CustomRichText(
              textList: [
                {
                  data.textData['payments']![0]: kSubTitleTextStyle,
                  'Learn more':
                      kSubTitleTextStyle.copyWith(color: kTextLinkColor)
                }
              ],
            ),
          ),
          const CustomListTile(
            leading: Icon(Icons.add_circle_outline_rounded),
            title: 'Add payment method',
          ),
          const ContentGap(
            height: 8.0,
          ),
          const CustomListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: 'Add payment method',
          ),
          Expanded(
            child: Container(
              color: const Color(0xff0b141b),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'images/upi.png',
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
