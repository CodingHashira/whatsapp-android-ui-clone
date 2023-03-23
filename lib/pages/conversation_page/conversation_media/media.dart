import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();
final double screenWidth = Data.screen.width;

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          PaddedSettingsTextInfo(
            text: 'Recent',
            textStyle: kInfoTextStyle2,
          ),
          ImageBuilder(
            itemCount: 3,
            startIndex: 1,
          ),
          SizedBox(height: 10.0),
          PaddedSettingsTextInfo(
            text: 'Last week',
            textStyle: kInfoTextStyle2,
          ),
          ImageBuilder(
            itemCount: 17,
            startIndex: 3,
          )
        ],
      ),
    );
  }
}

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({
    super.key,
    required this.itemCount,
    required this.startIndex,
  });

  final int itemCount;
  final int startIndex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Image.asset(
            'images/media/m${index + startIndex}.jpg',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
