import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.isChildWidget,
    required this.title,
    this.imageUrl,
    this.actions,
  }) : super(key: key);

  final bool isChildWidget;
  final String title;
  final String? imageUrl;
  final Widget? actions;

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 8,
      automaticallyImplyLeading: true,
      elevation: 0.0,
      leadingWidth: imageUrl != null ? 70 : 50,
      leading: isChildWidget
          ? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, //!
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    imageUrl != null
                        ? CircleAvatar(
                            radius: 18.0,
                            backgroundImage: AssetImage(imageUrl!),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            )
          : null,
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
