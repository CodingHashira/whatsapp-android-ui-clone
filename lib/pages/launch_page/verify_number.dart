import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/alert_dialogs/verify_user.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/pages/launch_page/verifying_number.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class VerifyNumberPage extends StatelessWidget {
  const VerifyNumberPage({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: kPrimaryColor,
        isChildWidget: true,
        iconColor: kSecondaryColor,
        title: 'Verify Phone number',
        centerTitle: true,
        actions: CustomPopupMenuButton(
          popupMenuItems: {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 52.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: CircleAvatar(
                radius: 28.0,
                backgroundColor: const Color(0xffcbf2ef),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: const [
                    Positioned(
                      top: 18.0,
                      child: Icon(
                        Icons.call_end_rounded,
                        color: kAccentColor,
                        size: 32.0,
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      child: Icon(
                        Icons.call_missed_rounded,
                        color: kAccentColor,
                        size: 23.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              'To automatically verify with a missed call to your phone:',
              style: kTitleTextStyle.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                const Icon(Icons.call, size: 18.0),
                const SizedBox(width: 20.0),
                Expanded(
                  child: CustomRichText(
                    textList: [
                      {
                        data.textData['verifyNumber']![0]:
                            kSubTitleTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        data.textData['verifyNumber']![1]:
                            kSubTitleTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      }
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Icon(Icons.wifi_calling_3_rounded, size: 18.0),
                const SizedBox(width: 20.0),
                Expanded(
                  child: CustomRichText(
                    textList: [
                      {
                        data.textData['verifyNumber']![2]:
                            kSubTitleTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        data.textData['verifyNumber']![3]:
                            kSubTitleTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      }
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'Learn more about how you can manage your',
              style: kSubTitleTextStyle.copyWith(fontSize: 14.0),
            ),
            Text(
              'phone verification permissions.',
              style: kSubTitleTextStyle.copyWith(
                  color: kTextLinkColor, fontSize: 14.0, height: 1.5),
            ),
            const SizedBox(height: 30.0),
            CustomButton(
              width: 280.0,
              onPressed: () {
                NavigationHelper.openPage(
                  context: context,
                  page: VerifyingNumberPage(
                    number: number,
                    type: 'call',
                  ),
                );

                NavigationHelper.openDialog(
                  context: context,
                  dismissible: false,
                  dialogWidget: const VerifyUserDialog(type: 'call'),
                );
              },
              title: 'Continue',
            ),
            CustomButton(
              width: 280.0,
              onPressed: () {
                NavigationHelper.openPage(
                  context: context,
                  page: VerifyingNumberPage(
                    number: number,
                    type: 'msg',
                  ),
                );

                NavigationHelper.openDialog(
                  context: context,
                  dismissible: false,
                  dialogWidget: const VerifyUserDialog(type: 'msg'),
                );
              },
              buttonColor: kPrimaryColor,
              titleStyle:
                  kTitleTextStyle.copyWith(color: kAccentColor, fontSize: 14.0),
              title: 'Verify with SMS',
            ),
          ],
        ),
      ),
    );
  }
}
