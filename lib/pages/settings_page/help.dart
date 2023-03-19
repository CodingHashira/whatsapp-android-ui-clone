import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';

const data = Data();

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Help',
      ),
      body: CustomListBuilder(
        padding: const EdgeInsets.only(top: 20.0),
        leadingWidth: 5.0,
        itemCount: data.helpOptionsList.length,
        list: data.helpOptionsList,
        returnWidgetType: CustomListTile,
      ),
    );
  }
}
