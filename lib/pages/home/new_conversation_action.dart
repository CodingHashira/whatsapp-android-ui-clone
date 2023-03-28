import 'package:flutter/material.dart';

import '../../model/data.dart';
import 'package:ui_flutter_whatsapp/common/appbar.dart';
import 'package:ui_flutter_whatsapp/common/divider.dart';
import 'package:ui_flutter_whatsapp/common/list_tile.dart';
import 'package:ui_flutter_whatsapp/common/popup_menu_button.dart';
import 'package:ui_flutter_whatsapp/constants.dart';
import 'new_conversation_action/selection_view.dart';

const data = Data();
List<Map> selectedContactList = [];
List<int> selectedIndexList = [];

class NewConversationActionPage extends StatefulWidget {
  const NewConversationActionPage({
    super.key,
    required this.pageType,
  });

  final String pageType;

  @override
  State<NewConversationActionPage> createState() =>
      _NewConversationActionPageState();
}

class _NewConversationActionPageState extends State<NewConversationActionPage> {
  late String title;
  late String subTitle;
  bool isSelected = false;

  void addSelection(int index) => setState(() {
        Map item = {
          'imageUrl': data.conversaionList[index].imageUrl,
          'title': data.conversaionList[index].title,
        };
        if (!selectedIndexList.contains(index)) {
          selectedIndexList.add(index);
          selectedContactList.add(item);
        }
      });

  void removeSelection(int index) => setState(() {
        selectedIndexList.removeAt(index);
        selectedContactList.removeAt(index);
      });

  bool getVisibilityStatus(int index) => selectedIndexList.contains(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.pageType != 'call'
          ? FloatingActionButton(
              backgroundColor: kAccentColor,
              onPressed: () {},
              child: Icon(
                widget.pageType == 'broadcast'
                    ? Icons.check_rounded
                    : Icons.arrow_forward_rounded,
              ),
            )
          : null,
      appBar: CustomAppBar(
        isChildWidget: true,
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pageType == 'group'
                  ? 'New Group'
                  : widget.pageType == 'call'
                      ? 'Select contact'
                      : 'New broadcast',
            ),
            Text(
              widget.pageType == 'group'
                  ? selectedContactList.isNotEmpty
                      ? '${selectedContactList.length} of ${data.conversaionList.length - 1} selected'
                      : 'Add participant'
                  : widget.pageType == 'broadcast'
                      ? '${selectedContactList.length} of ${data.conversaionList.length - 1} selected'
                      : '${data.conversaionList.length} contacts',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
        actions: SizedBox(
          width: 70.0,
          child: Row(
            mainAxisAlignment: widget.pageType != 'call'
                ? MainAxisAlignment.end
                : MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(width: widget.pageType != 'call' ? 15.0 : 0.0),
              widget.pageType == 'call'
                  ? CustomPopupMenuButton(
                      popupMenuItems: data.addCallPopupOptionsList,
                      popButtonColor: Colors.white,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.pageType == 'call')
            Column(
              children: [
                const CustomListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: kAccentColor,
                    child: Icon(
                      Icons.link_rounded,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  title: 'New call link',
                ),
                const CustomListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundColor: kAccentColor,
                    child: Icon(
                      Icons.people,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  title: 'New group call',
                ),
                CustomListTile(
                  onTap: () {},
                  leading: const CircleAvatar(
                    radius: 24.0,
                    backgroundColor: kAccentColor,
                    child: Icon(
                      Icons.person_add_rounded,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  title: 'New contact',
                  trailing: const Icon(
                    Icons.qr_code,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          if (widget.pageType == 'broadcast')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 80.0,
                  child: selectedContactList.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Center(
                            child: Text(
                              data.textData['broadcast']![0],
                              style:
                                  kSubTitleTextStyle.copyWith(fontSize: 15.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : SelectionView(
                          onTap: (p0) => removeSelection(p0),
                          selectedContactList: selectedContactList,
                        ),
                ),
                const CustomDivider(),
              ],
            ),
          if (widget.pageType == 'group')
            selectedContactList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        height: 80.0,
                        child: SelectionView(
                          onTap: (p0) => removeSelection(p0),
                          selectedContactList: selectedContactList,
                        ),
                      ),
                      const CustomDivider(),
                    ],
                  )
                : const SizedBox.shrink(),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            itemCount: data.conversaionList.length - 1,
            itemBuilder: (context, index) {
              return CustomListTile(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                onTap: widget.pageType != 'call'
                    ? () => addSelection(index + 1)
                    : null,
                wrapText: true,
                subTitleIndent: 100,
                leading: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 24.0,
                      backgroundImage:
                          AssetImage(data.conversaionList[index + 1].imageUrl),
                    ),
                    Visibility(
                      visible: getVisibilityStatus(index + 1),
                      child: const CircleAvatar(
                        backgroundColor: kAccentColor,
                        radius: 10.0,
                        child: Icon(
                          Icons.check,
                          color: kPrimaryColor,
                          size: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                title: data.conversaionList[index + 1].title,
                subTitle: data.conversaionList[index + 1].about,
                trailing: widget.pageType == 'call'
                    ? SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.call_rounded,
                              color: kAccentColor,
                            ),
                            Icon(
                              Icons.videocam_rounded,
                              color: kAccentColor,
                            ),
                          ],
                        ),
                      )
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
