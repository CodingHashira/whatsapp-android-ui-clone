import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'package:ui_flutter_whatsapp/model/data.dart';

const data = Data();

class HomeStatusPage extends StatelessWidget {
  const HomeStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: const StatusFloatingActionButton(),
      body: Column(
        children: [
          CustomListTile(
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const SizedBox(
                  width: 55.0,
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage('images/p1.jpg'),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kAccentColor,
                    border: Border.all(color: kPrimaryColor),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.0,
                  ),
                )
              ],
            ),
            title: 'My status',
            subTitle: 'Tap to add status update',
          ),
          ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: data.statusUpdateList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var subTitle = data.statusUpdateList[index]['subTitle']!;
              return CustomListTile(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2.8),
                  ),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage(
                      data.statusUpdateList[index]['statusUrl']!,
                    ),
                  ),
                ),
                title: data.statusUpdateList[index]['title']!,
                subTitle:
                    subTitle.contains(',') ? subTitle : 'Yesterday, $subTitle',
              );
            },
          )
        ],
      ),
    );
  }
}

class StatusFloatingActionButton extends StatelessWidget {
  const StatusFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 90.0,
          right: 5.0,
          child: SizedBox(
            height: 40.0,
            child: FloatingActionButton(
              backgroundColor: kAppBarColor,
              onPressed: () {
                // Handle first button press
              },
              child: const Icon(
                Icons.edit_rounded,
                size: 24.0,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 5.0,
          child: FloatingActionButton(
            heroTag: 'fab',
            onPressed: () {
              // Handle second button press
            },
            child: const Icon(Icons.camera_alt_rounded),
          ),
        ),
      ],
    );
  }
}
