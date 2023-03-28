import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/pages/home/calls.dart';
import 'package:ui_flutter_whatsapp/pages/home/chats.dart';
import 'package:ui_flutter_whatsapp/pages/home/community.dart';
import 'package:ui_flutter_whatsapp/pages/home/status.dart';
import 'package:ui_flutter_whatsapp/pages/home/tab.dart';
import 'package:ui_flutter_whatsapp/widgets/home/appbar.dart';
import 'package:ui_flutter_whatsapp/common/floating_action_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() => setState(() {
        currentTabIndex = _tabController.index;
      });

  List<IconData> iconList = [
    Icons.chat_rounded,
    Icons.camera_alt_rounded,
    Icons.add_ic_call_rounded,
  ];

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabWidth = MediaQuery.of(context).size.width / 4.8;
    List<Widget> myTabs = [
      const HomePageTab(
        icon: Icons.groups_rounded,
      ),
      SizedBox(
        width: tabWidth,
        child: const HomePageTab(
          title: 'Chats',
        ),
      ),
      SizedBox(
        width: tabWidth,
        child: const HomePageTab(
          title: 'Status',
        ),
      ),
      SizedBox(
        width: tabWidth,
        child: const HomePageTab(
          title: 'Calls',
        ),
      ),
    ];
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButton: currentTabIndex != 0
              ? CustomFloatingActionButton(
                  icon: iconList[currentTabIndex - 1],
                  showEditButton: currentTabIndex == 2 ? true : false,
                  index: currentTabIndex,
                )
              : const SizedBox.shrink(),
          appBar: LaunchPageAppBar(
            title: 'WhatsApp',
            tabIndex: currentTabIndex,
            bottom: TabBar(
              controller: _tabController,
              tabs: myTabs,
              isScrollable: true,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HomeCommunityPage(),
                    HomeChatsPage(),
                    HomeStatusPage(),
                    HomeCallsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
