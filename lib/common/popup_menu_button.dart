import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

import '../constants.dart';

final data = Data();

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    this.popButtonColor,
    // required this.popupMenuItems,
  });

  final Color? popButtonColor;
  // final Map<String, dynamic> popupMenuItems;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return PopupMenuButton(
      color: kPopupMenuColor,
      child: Icon(
        Icons.more_vert_rounded,
        color: popButtonColor ?? kSecondaryColor,
      ),
      itemBuilder: (context) => [
        for (var item in data.chatPopupMenuItems.entries)
          // for (var item in popupMenuItems.entries) // TODO to pass value from cons
          PopupMenuItem(
            padding: EdgeInsets.zero,
            child: item.value is Map
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 18.0),
                    child: PopupMenuButton(
                        color: kPopupMenuColor,
                        offset: Offset(width, -height),
                        onOpened: () => Navigator.pop(context),
                        child: Text(
                          item.key,
                          style: const TextStyle(
                            color: kTextPrimaryColor,
                          ),
                        ),
                        itemBuilder: (context) => [
                              for (var x in Map.from(item.value).entries)
                                PopupMenuItem(
                                  child: Text(
                                    x.key,
                                    style: const TextStyle(
                                      color: kTextPrimaryColor,
                                    ),
                                  ),
                                ),
                            ]),
                  )
                : PopupMenuItem(
                    onTap: () {
                      print('pressed');
                    },
                    child: Text(
                      item.key,
                      style: const TextStyle(
                        color: kTextPrimaryColor,
                      ),
                    ),
                  ),
          )
      ],
    );
  }
}
