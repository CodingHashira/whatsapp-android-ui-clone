import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';

class ChooseCountry extends StatelessWidget {
  const ChooseCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isChildWidget: true,
        title: 'Choose a country',
        actions: Icon(Icons.search),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
