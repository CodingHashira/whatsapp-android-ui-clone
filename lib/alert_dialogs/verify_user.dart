import 'dart:async';

import 'package:flutter/material.dart';

import '../pages/launch_page/account_initialization.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class VerifyUserDialog extends StatefulWidget {
  const VerifyUserDialog({
    super.key,
    required this.type,
  });

  final String type;

  @override
  State<VerifyUserDialog> createState() => _VerifyUserDialogState();
}

class _VerifyUserDialogState extends State<VerifyUserDialog> {
  var verified = false;

  Future<void> verificationMock() async {
    int counter = 0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      counter++;

      if (counter == 5) {
        setState(() {
          verified = true;
        });
      }

      if (counter == 7) {
        NavigationHelper.openPage(
          context: context,
          page: const AccountInitilizationPage(),
        );
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    verificationMock();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: kAppBarColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          height: 80.0,
          width: screenWidth,
          child: Row(
            children: [
              verified == false
                  ? const CircularProgressIndicator(
                      color: kAccentColor,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kAccentColor,
                          width: 2.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: kAccentColor,
                      ),
                    ),
              const SizedBox(width: 30.0),
              verified == false
                  ? Text(
                      widget.type == 'call'
                          ? 'Requesting a call'
                          : 'Waiting for OTP',
                      style: kSubTitleTextStyle.copyWith(
                        color: kSecondaryColor,
                        fontSize: 16.0,
                      ),
                    )
                  : Text(
                      'Verification complete',
                      style: kTitleTextStyle.copyWith(
                        color: kSecondaryColor,
                        fontSize: 16.0,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
