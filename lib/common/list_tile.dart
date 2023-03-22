import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

final double screenWidth = Data.screen.width;

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.contentPadding,
    this.leading,
    this.leadingAlignment,
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
    this.tileMaxHeight,
  });

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? contentPadding;
  final Widget? leading;
  final double? leadingWidth;
  final CrossAxisAlignment? leadingAlignment;
  final String title;
  final TextStyle? titleStyle;
  final double? titleIndent;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final double? subTitleIndent;
  final Widget? subTitleWidget;
  final Widget? trailing;
  final Alignment? trailingAlignment;
  final bool? isEnabled;
  final double? tileMaxHeight;

  @override
  Widget build(BuildContext context) {
    final defaultTitleStyle = kTitleTextStyle.copyWith(
      color: const Color(0xff3b4a55),
    );
    final defaultSubTitleStyle = kSubTitleTextStyle.copyWith(
      color: const Color(0xff3b4a55),
    );
    final hasSubTitle = subTitle != null || subTitleWidget != null;
    final hasLeading = leading != null;
    final hasTrailing = trailing != null;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: tileMaxHeight ?? 180.0,
        ),
        padding: padding ??
            const EdgeInsets.only(
                left: 10.0, top: 15.0, right: 5.0, bottom: 15.0),
        child: Stack(
          alignment: trailingAlignment ?? Alignment.topRight,
          children: [
            Row(
              crossAxisAlignment: leadingAlignment ?? CrossAxisAlignment.center,
              children: [
                SizedBox(width: leadingWidth ?? 10.0),
                if (hasLeading)
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: leading!,
                  ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth - (titleIndent ?? 90),
                        child: Text(
                          title,
                          style: titleStyle ??
                              (isEnabled ?? true
                                  ? kTitleTextStyle
                                  : defaultTitleStyle),
                        ),
                      ),
                      if (hasSubTitle) SizedBox(height: contentPadding ?? 0.0),
                      if (hasSubTitle)
                        SizedBox(
                          width: screenWidth - (subTitleIndent ?? 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (subTitle != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    subTitle!,
                                    style: subTitleStyle ??
                                        (isEnabled ?? true
                                            ? kSubTitleTextStyle
                                            : defaultSubTitleStyle),
                                  ),
                                ),
                              subTitleWidget != null
                                  ? subTitleWidget!
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (hasTrailing)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.0,
                    child: trailing!,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
