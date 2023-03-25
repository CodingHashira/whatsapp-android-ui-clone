import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';
import 'checkbox.dart';

final double screenWidth = Data.screen.width;

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.contentPadding,
    this.leading,
    this.leadingAlignment,
    this.title,
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
    this.leadingIndent,
    this.isEnabled = true,
    this.leadingEndIndent,
    this.tileColor,
    this.wrapText,
  });

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? contentPadding;
  final Widget? leading;
  final double? leadingIndent;
  final double? leadingEndIndent;
  final CrossAxisAlignment? leadingAlignment;
  final String? title;
  final TextStyle? titleStyle;
  final double? titleIndent;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final double? subTitleIndent;
  final Widget? subTitleWidget;
  final Widget? trailing;
  final Alignment? trailingAlignment;
  final bool? isEnabled;
  final Color? tileColor;
  final bool? wrapText;

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
      onTap: isEnabled != false ? onTap : null,
      behavior: HitTestBehavior.translucent,
      child: Container(
        color: tileColor,
        padding: padding ?? const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
        child: Stack(
          alignment: trailingAlignment ?? Alignment.topRight,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: leadingAlignment ?? CrossAxisAlignment.center,
              children: [
                SizedBox(width: leadingIndent ?? 10.0),
                if (hasLeading)
                  Padding(
                    padding: EdgeInsets.only(right: leadingEndIndent ?? 15.0),
                    child: leading!,
                  ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title != null
                          ? SizedBox(
                              height: 23.0,
                              width: screenWidth - (titleIndent ?? 90),
                              child: Text(
                                title!,
                                style: titleStyle ??
                                    (isEnabled ?? true
                                        ? kTitleTextStyle
                                        : defaultTitleStyle),
                              ),
                            )
                          : const SizedBox.shrink(),
                      hasSubTitle
                          ? SizedBox(height: contentPadding ?? 0.0)
                          : const SizedBox.shrink(),
                      hasSubTitle
                          ? SizedBox(
                              width: screenWidth - (subTitleIndent ?? 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (subTitle != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        subTitle!,
                                        maxLines: wrapText == true ? 1 : null,
                                        overflow: wrapText == true
                                            ? TextOverflow.ellipsis
                                            : null,
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
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
            hasTrailing
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 20.0,
                        child: trailing! is CustomCheckBox
                            ? CustomCheckBox(isEnabled: isEnabled)
                            : trailing!,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
