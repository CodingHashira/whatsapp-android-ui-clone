import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';

class ArchiveSettingsPage extends StatelessWidget {
  const ArchiveSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Archive Settings'),
    );
  }
}
