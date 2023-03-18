import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    this.padding,
    this.leading,
    this.leadingWidth,
    this.contentPadding,
    this.titleSize,
    this.titleColor,
    this.title,
    this.trailingWidget,
    this.subTitleSize,
    this.subTitle,
    this.subTitleWidthOffset,
    this.setLeadingAtTop,
    this.onTap,
    this.subTitleWidget,
    this.titleWidget,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final double? leadingWidth;
  final double? contentPadding;
  final double? titleSize;
  final Color? titleColor;
  final String? title;
  final Widget? trailingWidget;
  final double? subTitleSize;
  final String? subTitle;
  final double? subTitleWidthOffset;
  final bool? setLeadingAtTop;
  final VoidCallback? onTap;
  final Widget? subTitleWidget;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: setLeadingAtTop == true
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: leading,
              ),
            SizedBox(width: leadingWidth ?? 0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        SizedBox(
                          width: title!.length > 30 ? screenWidth - 120 : null,
                          child: Text(
                            title!,
                            style: kTitleTextStyle.copyWith(
                              color: titleColor,
                              fontSize: titleSize,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      if (titleWidget != null) titleWidget!,
                      if (trailingWidget != null)
                        SizedBox(
                          height: 22.0,
                          child: trailingWidget,
                        ),
                    ],
                  ),
                  SizedBox(height: contentPadding),
                  if (subTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: subTitleWidthOffset != null
                            ? screenWidth - subTitleWidthOffset!
                            : screenWidth - 120,
                        child: Text(
                          subTitle!,
                          style: kSubTitleTextStyle.copyWith(
                            fontSize: subTitleSize,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ),
                  if (subTitleWidget != null) subTitleWidget!
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
