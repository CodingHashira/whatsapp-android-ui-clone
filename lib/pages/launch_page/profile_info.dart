import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/button.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/common/text_field.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/pages/home.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final controller = TextEditingController();
  final node = FocusNode();

  bool isNameEntered = false;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const CustomAppBar(
          isChildWidget: false,
          backgroundColor: kPrimaryColor,
          title: 'Profile info',
          centerTitle: true,
          actions: CustomPopupMenuButton(
            popupMenuItems: {},
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 25.0),
            Center(
              child: Text(
                'Please provide your name and optional profile photo',
                style: kSubTitleTextStyle.copyWith(
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const CircleAvatar(
              radius: 48.0,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.add_a_photo_rounded,
                size: 45.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              width: screenWidth - 50,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      focusNode: node,
                      controller: controller,
                      onChanged: (p0) {
                        setState(() {
                          if (controller.text.length > 2) {
                            isNameEntered = true;
                          } else {
                            isNameEntered = false;
                          }
                        });
                      },
                      borderColor: kAccentColor,
                      hintText: 'Type your name here',
                    ),
                  ),
                  const Icon(Icons.emoji_emotions_rounded)
                ],
              ),
            ),
            const Spacer(),
            showLoading
                ? const CircularProgressIndicator(color: kAccentColor)
                : CustomButton(
                    title: 'Next',
                    onPressed: isNameEntered
                        ? () {
                            node.unfocus();
                            setState(() {
                              showLoading = true;
                            });

                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              NavigationHelper.openPage(
                                context: context,
                                page: const HomePage(),
                              );
                            });
                          }
                        : null,
                  ),
            const SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
