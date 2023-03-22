import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

import 'package:ui_flutter_whatsapp/model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/list_builder.dart';
import 'package:ui_flutter_whatsapp/widgets/country_code_tile.dart';

const data = Data();

class ChooseCountry extends StatelessWidget {
  const ChooseCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isChildWidget: true,
        title: 'Choose a country',
        actions: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.search,
            color: kSecondaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          CustomListBuilder(
            startIndex: 0,
            itemCount: data.countryCodesList.length,
            list: data.countryCodesList,
            returnWidgetType: CountryCodeTile,
          ),
        ],
      ),
    );
  }
}
