import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/common/text_field.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';

const data = Data();
final double screenHeight = Data.screen.height;

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Contact us',
        actions: CustomPopupMenuButton(
          popupMenuItems: {'Send via mail': '/testPage'},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                color: kAppBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
              ),
              height: screenHeight / 7.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CustomTextField(
                    hideBorder: true,
                    textHeight: 0.0,
                    hintText: 'Tell us how we can help',
                  ),
                ],
              ),
            ),
            CustomListTile(
              leadingIndent: 0.0,
              padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
              trailingAlignment: Alignment.topRight,
              title: 'Include device information? (optional)',
              subTitleIndent: 80,
              subTitleWidget: CustomRichText(
                textList: [
                  {
                    data.textData['contactsUs']![0]: kSubTitleTextStyle,
                    'Learn more': const TextStyle(color: kAccentColor),
                  }
                ],
              ),
              trailing: Checkbox(
                visualDensity: VisualDensity.compact,
                activeColor: kAccentColor,
                checkColor: kPrimaryColor,
                value: true,
                onChanged: (p0) {},
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: kTextBoxBorderColor,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: CustomRichText(
                textList: [
                  {
                    data.textData['contactsUs']![1]:
                        kSubTitleTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    data.textData['contactsUs']![2]: const TextStyle(
                      color: kSecondaryColor,
                    ),
                    data.textData['contactsUs']![3]: const TextStyle(
                      color: kTextLinkColor,
                      fontWeight: FontWeight.w400,
                    ),
                  },
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'We will respond to you in a WhatsApp chat',
                    style: kInfoTextStyle2.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const CustomButton(
                  title: 'Next',
                  routeName: '',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
