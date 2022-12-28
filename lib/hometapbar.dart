import 'package:flutter/material.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/CardSQLite.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/sqlite_card_model.dart';
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
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        //handler.queryUserCardDeck();
      });
      chkFirstDeck();
    });
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
      // appBar: AppBar(title: Text('test')),
      body: TabBarView(
        controller: tabController,
        children: const [
          Info(),
          Home(),
          Shop(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 70,
        child: TabBar(
          labelColor: Colors.yellow,
          indicatorColor: Colors.yellow,
          unselectedLabelColor: Colors.indigo,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.info,
                //  color: Colors.amber,
              ),
              text: 'Info',
            ),
            Tab(
              icon: Icon(
                Icons.home,
                //color: Colors.blueAccent,
              ),
              text: 'Main',
            ),
            Tab(
              icon: Icon(
                Icons.shop_2_outlined,
                //  color: Colors.red,
              ),
              text: 'Shop',
            )
          ],
        ),
      ),
    );
  }

  //2022-12-29 Hosik
  Future<bool> chkFirstDeck() async {
    List<SupportCard> chkFirstDeck = await handler.queryUserCardDeck();

    if (chkFirstDeck.isEmpty) {
      print('have not DATA');
      handler.insertFirstUserCardDeck1();
      handler.insertFirstUserCardDeck2();
      handler.insertFirstUserCardDeck3();
      handler.insertFirstUserCardDeck4();
    }
    // else {
    //   print(
    //       'info_supportCard.dart 에서 카드 리스트 불러올때 카드가 있다면 나오는 곳 chkFirstDeck Function');

    // }
    return true;
  }
}
