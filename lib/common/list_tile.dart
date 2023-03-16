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
    required this.title,
    this.trailingWidget,
    this.subTitleSize,
    this.subTitle,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final double? leadingWidth;
  final double? contentPadding;
  final double? titleSize;
  final String title;
  final Widget? trailingWidget;
  final double? subTitleSize;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20.0),
        child: Row(
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
                    children: [
                      Text(
                        title,
                        style: kTitleTextStyle.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: titleSize,
                        ),
                      ),
                      if (trailingWidget != null)
                        SizedBox(
                          height: 0.0,
                          child: trailingWidget,
                        ),
                    ],
                  ),
                  SizedBox(height: contentPadding),
                  if (subTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: leading == null
                            ? screenWidth - 120
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
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
