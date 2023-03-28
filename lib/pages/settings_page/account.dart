import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';

const data = Data();

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Account',
      ),
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          CustomListBuilder(
            tileMargin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.5),
            startIndex: 0,
            itemCount: data.accountMenu.length,
            leadingIndent: 8.0,
            list: data.accountMenu,
            returnWidgetType: CustomListTile,
          ),
        ],
      ),
    );
  }
}
