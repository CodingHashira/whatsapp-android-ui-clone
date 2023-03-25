import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();
bool isfavorite = false;

class CustomImageView extends StatefulWidget {
  const CustomImageView({
    super.key,
    required this.imagePath,
    this.actionsList,
    this.titleWidget,
  });

  final String imagePath;
  final List<Widget>? actionsList;
  final Widget? titleWidget;

  @override
  State<CustomImageView> createState() => _CustomImageViewState();
}

class _CustomImageViewState extends State<CustomImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        backgroundColor: Colors.black,
        isChildWidget: true,
        titleWidget: widget.titleWidget ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monica',
                  style: kTitleTextStyle.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  'March 20, 11:35',
                  style: kSubTitleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
        actions: SizedBox(
          width: 130.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.actionsList ??
                [
                  GestureDetector(
                    onTap: () => setState(() {
                      isfavorite = !isfavorite;
                    }),
                    child: Icon(
                      !isfavorite
                          ? Icons.star_border_rounded
                          : Icons.star_rounded,
                      size: 27.0,
                    ),
                  ),
                  const Icon(
                    Icons.share_rounded,
                    size: 25.0,
                  ),
                  CustomPopupMenuButton(
                    popupMenuItems: data.imageViewPopupMenuOptions,
                    popButtonColor: Colors.white,
                    popButtonSize: 27.0,
                  )
                ],
          ),
        ),
      ),
      body: Center(child: Image.asset(widget.imagePath)),
    );
  }
}
