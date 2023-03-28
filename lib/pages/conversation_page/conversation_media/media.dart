import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import '../../../widgets/conversation_page/image_builder.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const PaddedSettingsTextInfo(
            text: 'Recent',
            textStyle: kInfoTextStyle2,
          ),
          ImageBuilder(
            itemCount: 3,
            startIndex: 1,
            title: title,
          ),
          const SizedBox(height: 10.0),
          const PaddedSettingsTextInfo(
            text: 'Last week',
            textStyle: kInfoTextStyle2,
          ),
          ImageBuilder(
            itemCount: 17,
            startIndex: 3,
            title: title,
          )
        ],
      ),
    );
  }
}
