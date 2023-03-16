import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';

import '../../model/data.dart';

const data = Data();

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            isChildWidget: true,
            title: 'Account',
          ),
          const SizedBox(height: 8.0),
          CustomListBuilder(
            itemCount: data.accountMenu.length,
            leadingWidth: 8.0,
            list: data.accountMenu,
            startIndex: 0,
          ),
        ],
      ),
    );
  }
}
