import 'package:flutter/material.dart';
import 'package:solo_game_project/inInfo/info_Inventory.dart';
import 'package:solo_game_project/inInfo/info_main.dart';

import 'package:solo_game_project/inInfo/info_supportCard.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoBody();
  }
}

class InfoBody extends StatefulWidget {
  const InfoBody({super.key});

  @override
  State<InfoBody> createState() => _InfoBodyState();
}

class _InfoBodyState extends State<InfoBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    /// tabbar 할때 이 종료 안해주면 쓰래기 엄청 쌓임
    tabController.dispose(); // <<<<<<<<
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          InfoMain(),
          InfoSupportCard(),
          InfoInventory(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 40,
        child: TabBar(
          labelColor: Colors.yellow,
          indicatorColor: Colors.yellow,
          unselectedLabelColor: Colors.indigo,
          controller: tabController,
          tabs: const [
            Tab(
              text: 'equipment',
            ),
            Tab(
              text: 'Support Card',
            ),
            Tab(
              text: 'Inventory',
            ),
          ],
        ),
      ),
    );
  }
}
