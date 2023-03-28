import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/constants.dart';

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
    this.titleWidget,
  });

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? contentPadding;
  final Widget? leading;
  final double? leadingIndent;
  final double? leadingEndIndent;
  final MainAxisAlignment? leadingAlignment;
  final String? title;
  final Widget? titleWidget;
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
    final screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      tileColor: tileColor,
      dense: leading is Icon ? true : false,
      visualDensity: VisualDensity(vertical: leading == CircleAvatar ? -4 : 0),
      onTap: isEnabled != false ? onTap : null,
      contentPadding: padding ?? const EdgeInsets.all(5.0),
      minLeadingWidth: leadingEndIndent ?? 0.0,
      leading: leading != null
          ? Padding(
              padding: EdgeInsets.only(left: leadingIndent ?? 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: leadingAlignment ?? MainAxisAlignment.center,
                children: [
                  leading!,
                ],
              ),
            )
          : const SizedBox.shrink(),
      title: title != null
          ? Text(
              title!,
              style: titleStyle ??
                  (isEnabled ?? true ? kTitleTextStyle : defaultTitleStyle),
            )
          : titleWidget,
      subtitle: subTitle != null
          ? Container(
              padding: EdgeInsets.only(top: contentPadding ?? 3.0),
              width: screenWidth - (subTitleIndent ?? 0),
              child: Text(
                subTitle!,
                style: subTitleStyle ??
                    (isEnabled ?? true
                        ? kSubTitleTextStyle
                        : defaultSubTitleStyle),
                maxLines: wrapText == true ? 1 : null,
                overflow: wrapText == true ? TextOverflow.ellipsis : null,
              ),
            )
          : subTitleWidget,
      trailing: trailing != null
          ? Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Stack(
                alignment: trailingAlignment ?? Alignment.topRight,
                children: [
                  trailing!,
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
