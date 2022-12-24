import 'package:flutter/material.dart';
import 'package:solo_game_project/home.dart';
import 'package:solo_game_project/info.dart';
import 'package:solo_game_project/shop.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeTabBody();
  }
}

class HomeTabBody extends StatefulWidget {
  const HomeTabBody({super.key});

  @override
  State<HomeTabBody> createState() => _HomeTabBodyState();
}

class _HomeTabBodyState extends State<HomeTabBody>
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
          Info(),
          Home(),
          Shop(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        height: 55,
        child: TabBar(
          labelColor: Colors.purple,
          indicatorColor: Colors.pink,
          unselectedLabelColor: Colors.amber,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                //  color: Colors.amber,
              ),
              text: 'one',
            ),
            Tab(
              icon: Icon(
                Icons.home,
                //color: Colors.blueAccent,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
