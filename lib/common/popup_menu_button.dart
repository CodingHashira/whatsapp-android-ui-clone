import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

final double screenWidth = Data.screen.width;

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    Key? key,
    this.popButtonColor,
    required this.popupMenuItems,
    this.popButtonSize,
  }) : super(key: key);

  final Color? popButtonColor;
  final double? popButtonSize;
  final Map<String, dynamic> popupMenuItems;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: kPopupMenuColor,
      child: Container(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.more_vert_rounded,
          color: popButtonColor ?? kPopupMenuIconColor,
          size: popButtonSize,
        ),
      ),
      itemBuilder: (context) => _buildPopupMenuItems(context, popupMenuItems),
    );
  }

  List<PopupMenuEntry<dynamic>> _buildPopupMenuItems(
      BuildContext context, Map<String, dynamic> menuItems) {
    final menuItemsLength = menuItems.length;
    return menuItems.entries.map((entry) {
      final label = entry.key;
      final value = entry.value;
      if (value is Map<String, dynamic>) {
        return PopupMenuItem(
          height: menuItemsLength > 1 ? 40.0 : 30.0,
          padding: EdgeInsets.zero,
          child: ListTile(
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              label,
              style: const TextStyle(
                color: kTextPrimaryColor,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              color: kPopupMenuIconColor,
            ),
            onTap: () => Future(() {
              Navigator.pop(context);
              _showNestedPopupMenu(context, value);
            }),
          ),
        );
      } else {
        return PopupMenuItem(
          height: menuItemsLength > 1 ? 40.0 : 30.0,
          padding: menuItemsLength == 1
              ? const EdgeInsets.only(left: 10.0)
              : null, // !
          onTap: () => Future(
            () => NavigationHelper.openRoute(
              context: context,
              pageRoute: value,
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: kTextPrimaryColor,
            ),
          ),
        );
      }
    }).toList();
  }

  void _showNestedPopupMenu(
      BuildContext context, Map<String, dynamic> nestedMenuItems) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    showMenu(
      color: kPopupMenuColor,
      context: context,
      position: RelativeRect.fromLTRB(width, 0, 0, height),
      items: _buildPopupMenuItems(context, nestedMenuItems),
    );
  }
}
