import 'package:flutter/material.dart';
import 'package:ui_flutter_whatsapp/constants.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({
    super.key,
    required this.selectedContactList,
    required this.onTap,
  });

  final List<Map> selectedContactList;
  final Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: selectedContactList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('IMPL : $index');
            onTap(index);
          },
          // onTap: () => setState(() {
          //   widget.selectedContactList.removeAt(index);
          // }),
          child: SizedBox(
            width: 47.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 22.0,
                      backgroundImage:
                          AssetImage(selectedContactList[index]['imageUrl']),
                    ),
                    CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.close,
                        color: Colors.grey.shade800,
                        size: 15.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.0),
                Text(
                  selectedContactList[index]['title'],
                  style: kSubTitleTextStyle.copyWith(fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 10.0);
      },
    );
  }
}
