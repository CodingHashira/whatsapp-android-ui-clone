import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.isChildWidget,
    required this.title,
    this.imageUrl,
    this.actions,
    this.iconColor,
    this.backgroundColor,
  }) : super(key: key);

  final bool isChildWidget;
  final String title;
  final String? imageUrl;
  final Widget? actions;
  final Color? iconColor;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      titleSpacing: 5,
      elevation: 0.0,
      toolbarHeight: 60,
      leadingWidth: imageUrl != null ? 80 : 60,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            isChildWidget
                ? Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: iconColor ?? kPopupMenuIconColor,
                      size: 25,
                    ),
                  )
                : const SizedBox.shrink(),
            imageUrl != null
                ? CircleAvatar(
                    radius: 18.0,
                    backgroundImage: AssetImage(imageUrl!),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: actions != null ? [actions!] : null,
      centerTitle: false,
    );
  }
}
