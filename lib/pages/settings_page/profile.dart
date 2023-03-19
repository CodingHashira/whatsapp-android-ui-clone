import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(isChildWidget: true, title: 'Profile'),
    );
  }
}
