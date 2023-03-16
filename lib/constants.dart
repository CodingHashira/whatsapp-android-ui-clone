import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff121b22);

const kSecondaryColor = Color(0xff8596a0);

const kAccentColor = Color(0xff159e83);

const kAppBarColor = Color(0xff1f2c34);

const kTextPrimaryColor = Colors.white;

const kPopupMenuColor = Color(0xff233239);

const kDividerColor = Color(0xff232d34);

const kPopupMenuIconColor = Color(0xffbbc0c3);

const kMyTextBubbleColor = Color(0xff005d4b);

const kCheckColor = Color(0xff7eafa5);

const kActiveCheckColor = Colors.blue;

const kTitleTextStyle = TextStyle(
  color: kTextPrimaryColor,
  fontSize: 16.5,
  fontWeight: FontWeight.w500,
);

const kSubTitleTextStyle = TextStyle(
  color: kSecondaryColor,
  fontSize: 14.0,
);

const kTimeTextStyle = TextStyle(
  color: kSecondaryColor,
  fontSize: 12.5,
);

const kInfoTextStyle = TextStyle(
  color: kSecondaryColor,
  fontSize: 14.5,
);

final kThemeData = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  iconTheme: const IconThemeData(color: kSecondaryColor),
  appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: kAccentColor.withOpacity(0.5),
    selectionHandleColor: kAccentColor,
  ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
);
