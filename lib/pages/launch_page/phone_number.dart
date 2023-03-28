import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ui_flutter_whatsapp/alert_dialogs/number_confirmation.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/common/rich_text.dart';
import 'package:ui_flutter_whatsapp/common/text_field.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class GetPhoneNumberPage extends StatefulWidget {
  const GetPhoneNumberPage({super.key});

  @override
  State<GetPhoneNumberPage> createState() => _GetPhoneNumberPageState();
}

class _GetPhoneNumberPageState extends State<GetPhoneNumberPage> {
  final controller = TextEditingController();
  var numberLength = 0;

  void updateNumberLength() => setState(() {
        numberLength = controller.text.length;
      });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            height: 35.0,
            color: kAppBarColor,
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter your phone number',
                    style: kTitleTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const CustomPopupMenuButton(
                popupMenuItems: {
                  'Help': '',
                },
                popButtonColor: kSecondaryColor,
                popButtonSize: 22.0,
              ),
            ],
          ),
          CustomRichText(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0),
            textAlign: TextAlign.center,
            textList: [
              {
                'WhatsApp will need to verify your phone number.':
                    kSubTitleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
                ' What\'s my number': kSubTitleTextStyle.copyWith(
                  color: kTextLinkColor,
                  fontSize: 14.0,
                )
              },
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: screenWidth / 1.75,
            child: CustomTextField(
              onTap: () => NavigationHelper.openRoute(
                context: context,
                pageRoute: '/chooseCountry',
              ),
              textAlign: TextAlign.center,
              borderColor: kAccentColor,
              isReadOnly: true,
              value: 'India',
              label: '',
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: kAccentColor,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth / 1.75,
            child: Row(
              children: [
                const Expanded(
                  child: CustomTextField(
                    borderColor: kAccentColor,
                    label: '',
                    isReadOnly: true,
                    value: '+',
                    suffix: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 25.0),
                      child: Text(
                        '  91',
                        style: TextStyle(
                          color: kTextPrimaryColor,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 3,
                  child: CustomTextField(
                    controller: controller,
                    onChanged: (p0) => updateNumberLength(),
                    autoFocus: true,
                    borderColor: kAccentColor,
                    label: '',
                    inputFormatters: FilteringTextInputFormatter.digitsOnly,
                    maxLength: 10,
                    keyBoardType: TextInputType.number,
                    hintText: 'Phone number',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            'Carrier charges may apply',
            style: kSubTitleTextStyle.copyWith(fontSize: 13.0),
          ),
          const Spacer(),
          CustomButton(
            onPressed: numberLength == 10
                ? () => NavigationHelper.openDialog(
                      context: context,
                      dialogWidget: NumberConfirmationDialog(
                        number: controller.text,
                      ),
                    )
                : null,
            title: 'Next',
            // routeName: routeName,
          ),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
