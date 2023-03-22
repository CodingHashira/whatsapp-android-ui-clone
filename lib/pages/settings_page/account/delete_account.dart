import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/text_field.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

const data = Data();

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Delete my account',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            leading: const Icon(
              Icons.warning_rounded,
              color: kRedColor,
            ),
            title: 'Deleting your account will:',
            titleStyle: kTitleTextStyle.copyWith(
              color: kRedColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 60.0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.delAccountInfoList.length,
            itemBuilder: (context, index) {
              return Text(
                data.delAccountInfoList[index],
                style: kInfoTextStyle,
              );
            },
          ),
          const SizedBox(height: 15.0),
          const CustomDivider(indent: 60),
          const CustomListTile(
            padding: EdgeInsets.only(left: 15.0, top: 20.0, bottom: 5.0),
            leading: Icon(Icons.send_to_mobile_rounded),
            title: 'Change number instead?',
          ),
          const Padding(
            padding: EdgeInsets.only(left: 65.0),
            child: CustomButton(
              title: 'Change Number',
              routeName: '',
            ),
          ),
          const SizedBox(height: 10.0),
          const CustomDivider(),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, top: 20.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.textData['deleteAccount']![0],
                  style: kInfoTextStyle2.copyWith(
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  onTap: () => NavigationHelper.openRoute(
                    context: context,
                    pageRoute: '/chooseCountry',
                  ),
                  isReadOnly: true,
                  value: 'India',
                  label: 'Country',
                  suffix: const Icon(Icons.arrow_drop_down),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: const [
                    Expanded(
                      child: CustomTextField(
                        isReadOnly: true,
                        value: '+',
                        suffix: Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 25.0),
                          child: Text(
                            '91',
                            style: TextStyle(
                              color: kTextPrimaryColor,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                        label: 'Phone',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        label: '',
                        maxLength: 10,
                        keyBoardType: TextInputType.number,
                        hintText: 'Phone number',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const CustomButton(
                  title: 'Delete my account',
                  buttonColor: kRedColor,
                  routeName: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
