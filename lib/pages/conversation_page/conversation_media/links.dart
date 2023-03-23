import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/padded_settings_textinfo.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          PaddedSettingsTextInfo(text: 'Links'),
        ],
      ),
    );
  }
}
