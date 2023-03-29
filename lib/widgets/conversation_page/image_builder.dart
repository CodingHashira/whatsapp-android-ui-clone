import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/image_view.dart';
import 'package:ui_flutter_whatsapp/services/handle_navigation.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    super.key,
    required this.itemCount,
    required this.startIndex,
    required this.title,
  });

  final int itemCount;
  final int startIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        var imagePath = 'images/media/m${index + startIndex}.jpg';
        return GestureDetector(
          onTap: () => NavigationHelper.openPage(
            context: context,
            page: CustomImageView(
              imagePath: imagePath,
              title: title,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
