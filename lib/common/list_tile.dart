import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

final double screenWidth = Data.screen.width;

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.contentPadding,
    this.leading,
    required this.title,
    this.titleStyle,
    this.titleIndent,
    this.subTitle,
    this.subTitleStyle,
    this.subTitleWidget,
    this.subTitleIndent,
    this.trailing,
    this.onTap,
    this.trailingAlignment,
    this.padding,
    this.leadingWidth,
    this.isEnabled,
  });

  final double? contentPadding;
  final Widget? leading;
  final String title;
  final TextStyle? titleStyle;
  final double? titleIndent;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final double? subTitleIndent;
  final Widget? subTitleWidget;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Alignment? trailingAlignment;
  final EdgeInsetsGeometry? padding;
  final double? leadingWidth;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.only(
                left: 10.0, top: 15.0, right: 25.0, bottom: 15.0),
        child: Stack(
          alignment: trailingAlignment ?? Alignment.topRight,
          children: [
            Row(
              children: [
                SizedBox(width: leadingWidth ?? 10.0),
                leading != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: leading!,
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth - (titleIndent ?? 90),
                        child: Text(
                          title,
                          style: titleStyle ??
                              (isEnabled != false
                                  ? kTitleTextStyle
                                  : kTitleTextStyle.copyWith(
                                      color: const Color(0xff3b4a55),
                                    )),
                        ),
                      ),
                      SizedBox(height: contentPadding ?? 5.0),
                      subTitle != null || subTitleWidget != null
                          ? SizedBox(
                              width: screenWidth - (subTitleIndent ?? 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  subTitle != null
                                      ? Text(
                                          subTitle!,
                                          style: subTitleStyle ??
                                              (isEnabled != false
                                                  ? kSubTitleTextStyle
                                                  : kSubTitleTextStyle.copyWith(
                                                      color: const Color(
                                                          0xff3b4a55),
                                                    )),
                                        )
                                      : const SizedBox.shrink(),
                                  subTitleWidget != null
                                      ? subTitleWidget!
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
            trailing != null
                ? Container(
                    constraints:
                        const BoxConstraints(maxWidth: 30, maxHeight: 30),
                    child: trailing,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
