import 'package:flutter/material.dart';

import '../constants.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    Key? key,
    this.popButtonColor,
    required this.popupMenuItems,
  }) : super(key: key);

  final Color? popButtonColor;
  final Map<String, dynamic> popupMenuItems;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: kPopupMenuColor,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.more_vert_rounded,
          color: popButtonColor ?? kPopupMenuIconColor,
        ),
      ),
      itemBuilder: (context) => _buildPopupMenuItems(context, popupMenuItems),
    );
  }

  List<PopupMenuEntry<dynamic>> _buildPopupMenuItems(
      BuildContext context, Map<String, dynamic> menuItems) {
    return menuItems.entries.map((entry) {
      final label = entry.key;
      final value = entry.value;
      if (value is Map<String, dynamic>) {
        return PopupMenuItem(
          padding: EdgeInsets.zero,
          child: ListTile(
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
          onTap: () => Future(() {
            Navigator.pop(context);
            Navigator.pushNamed(context, value);
          }),
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
