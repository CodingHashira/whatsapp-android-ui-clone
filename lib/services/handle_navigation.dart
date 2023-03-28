import 'package:flutter/material.dart';

class NavigationHelper {
  static void handle({
    required BuildContext context,
    required List list,
    required int startIndex,
    required int index,
  }) {
    var pageRoute = list[index + startIndex]['pageRoute'];
    var dialogWidget = list[index + startIndex]['dialogWidget'];

    if (pageRoute != null) {
      openRoute(context: context, pageRoute: pageRoute);
    }
    if (dialogWidget != null) {
      openDialog(context: context, dialogWidget: dialogWidget);
    }
  }

  static void openPage({
    required BuildContext context,
    Widget? page,
  }) {
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    }
  }

  static void openRoute({
    required BuildContext context,
    String? pageRoute,
  }) {
    if (pageRoute != '' && pageRoute != null) {
      Navigator.pushNamed(context, pageRoute);
    }
  }

  static void openDialog({
    required BuildContext context,
    Widget? dialogWidget,
    bool? dismissible,
  }) {
    if (dialogWidget != null) {
      showDialog(
          barrierDismissible: dismissible ?? true,
          context: context,
          builder: (context) {
            return dialogWidget;
          });
    }
  }
}
