import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.textList,
    this.textAlign = TextAlign.left,
    this.padding,
  }) : super(key: key);

  final List<Map<String, TextStyle>> textList;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0.0),
      child: Text.rich(
        TextSpan(
          children: [
            for (var item in textList)
              for (var textMap in item.entries)
                TextSpan(text: textMap.key, style: textMap.value),
          ],
        ),
        textAlign: textAlign,
      ),
    );
  }
}
