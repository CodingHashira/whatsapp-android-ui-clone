import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.textList,
  });

  final List<Map<String, TextStyle>> textList;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          for (var item in textList)
            for (var textMap in item.entries)
              TextSpan(text: textMap.key, style: textMap.value),
        ],
      ),
    );
  }
}
