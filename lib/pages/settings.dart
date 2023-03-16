import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(isChildWidget: true, title: 'Settings'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomListTile(
                    contentPadding: 2.0,
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('images/p1.jpg'),
                    ),
                    title: 'Joey',
                    leadingWidth: 5.0,
                    titleSize: 20,
                    subTitle: 'Urgent calls only',
                    subTitleSize: 13.5,
                    trailingWidget: Icon(
                      Icons.qr_code_rounded,
                      color: kAccentColor,
                      size: 27.0,
                    ),
                  ),
                  const Divider(
                    color: kDividerColor,
                    height: 0.7,
                  ),
                  CustomListBuilder(
                    itemCount: data.settingsMenu.length,
                    leadingWidth: 10.0,
                    list: data.settingsMenu,
                    startIndex: 0,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'from',
                            style: kInfoTextStyle.copyWith(
                              fontSize: 13.0,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.line_axis_sharp,
                                color: Color(0xffc7c8ca),
                                size: 18.0,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                'Meta',
                                style: kSubTitleTextStyle.copyWith(
                                  color: const Color(0xffc7c8ca),
                                  fontSize: 13.0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
