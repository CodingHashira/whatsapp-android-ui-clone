import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class CountryCodeTile extends StatelessWidget {
  const CountryCodeTile({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
    required this.code,
    this.isSelected,
  });

  final String icon;
  final String title;
  final String? subTitle;
  final String code;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          child: Row(
            children: [
              Padding(padding: const EdgeInsets.all(15.0), child: Text(icon)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: isSelected != null
                        ? kTitleTextStyle.copyWith(
                            color: kAccentColor,
                            fontWeight: FontWeight.w500,
                          )
                        : kTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  subTitle != null
                      ? Text(
                          subTitle!,
                          style: kSubTitleTextStyle,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: kCountryCodeTextStyle,
                    ),
                    const SizedBox(width: 5.0),
                    isSelected != null
                        ? const Icon(
                            Icons.check,
                            color: kAccentColor,
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ],
          ),
        ),
        const CustomDivider()
      ],
    );
  }
}
