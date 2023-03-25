import 'package:flutter/material.dart';

import 'package:ui_flutter_whatsapp/pages/home/calls.dart';
import 'package:ui_flutter_whatsapp/pages/home/chats.dart';
import 'package:ui_flutter_whatsapp/pages/home/community.dart';
import 'package:ui_flutter_whatsapp/pages/home/status.dart';
import 'package:ui_flutter_whatsapp/pages/home/tab.dart';
import 'package:ui_flutter_whatsapp/widgets/home/appbar.dart';
import '../model/data.dart';

final double screenWidth = Data.screen.width;
final tabWidth = screenWidth / 4.8;

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
        print(currentTabIndex);
      });

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: LaunchPageAppBar(
          title: 'WhatsApp',
          bottom: TabBar(
            tabs: myTabs,
            isScrollable: true,
          ),
        ),
        body: Column(
          children: const [
            Expanded(
              child: TabBarView(
                children: [
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
    );
  }
}
