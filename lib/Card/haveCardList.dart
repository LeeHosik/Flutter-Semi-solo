import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/CardSQLite.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/sqlite_card_model.dart';
import 'package:solo_game_project/Card/static_card.dart';
import 'package:http/http.dart' as http;
import 'package:solo_game_project/login/static_user.dart';

class haveCardList extends StatefulWidget {
  haveCardList({super.key});

  @override
  State<haveCardList> createState() => _haveCardListState();
}

class _haveCardListState extends State<haveCardList> {
  late String ChrUID;
  late String CardCategory;
  late List data;
  late List detailData;
  late String cardSeq;
  late String staticHelp;
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CardCategory = card_static.card_category;
    data = [];
    detailData = [];
    switch (CardCategory) {
      case '공격':
        staticHelp = card_static.used_card_one;
        break;
      case '방어':
        staticHelp = card_static.used_card_one;
        break;
      case '유틸':
        staticHelp = card_static.used_card_one;
        break;
      default:
        staticHelp = card_static.used_card_one;
        break;
    }
    ChrUID = "";
    _initSharedPreferences();

    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        //
      });
    });

    // getJsonDatahaveCardList(ChrUID, CardCategory);
  }

  // 아이디로 가지고 있는 카드 리스트 불러오기

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: data.isEmpty
            ? Image.network(
                'https://i.pinimg.com/originals/fa/6a/a8/fa6aa8b9f02691e42df56f1678e795fc.gif')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return cardBuild(context, index);
                },
              ),
      ),
    );
  }

  Widget cardBuild(BuildContext context, int index) {
    final mq = MediaQuery.of(context);
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // int justInputSupSeq = int.parse(data[index]['sup_seq']);
                  // print(user_static.staticUser_chrUID);
                  handler.updateUserCardDeck(
                    SupportCard(
                      // sup_seq: card_static.cardDeckCategory,
                      sup_name: data[index]['sup_Name'],
                      sup_decknum: SupportCard.static_sup_deck_index,
                      sup_category: data[index]['sup_category'],
                      sup_grade: data[index]['sup_grade'],
                      sup_card_img: data[index]['sup_card_img'],
                    ),
                  );

                  staticHelp = data[index]['sup_card_img'];
                  Get.back();
                },
                onLongPress: () =>
                    getJsonDataForDetailView(data[index]['sup_seq']),
                child: Image.network(
                  data[index]['sup_card_img'],
                  width: mq.size.width * 0.2,
                  // height: mq.size.height * 0.3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Text(
                            data[index]['sup_Name'],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  } // cardBuild END

  // ----------------------- Function -----------------------
//2022-12-28 Hosik SharedPreferences
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    print('이거 제대로 돠고 있는거 맞으 ㅁ/ ${prefs.getString('user_chrUID')!}');
    // setState(() {
    ChrUID = (prefs.getString('user_chrUID'))!;
    // userPw = (prefs.getString('WPSRESU'))!;
    // });
    print('<<<<<<>>>>>><<<<<<<<');
    print('_initSharedPReferences Function in => $ChrUID');
    getJsonDatahaveCardList(ChrUID, CardCategory);
  } //  _initSharedPreferences END

  // 2022-12-27 Hosik
  Future getJsonDatahaveCardList(String ChrUIDs, String CardCategory) async {
    String getChrUID = ChrUIDs;
    String getCategory = CardCategory;

    print('getChrUID => $getChrUID');
    print('getCategory => $getCategory');
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Card/haveCard_list.jsp?ChrUID=$getChrUID&category=$getCategory');

    var response = await http.get(url);

    data.clear();
    var dateConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    List result = dateConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });

    return true;
  } // getJsonDatahaveCardList END

// for DetailView
  Future getJsonDataForDetailView(String supportCardSeq) async {
    String sup_seq = supportCardSeq;

    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Card/forDetailView.jsp?sup_seq=$sup_seq');

    var response = await http.get(url);

    detailData.clear();
    var dateConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    List result = dateConvertedJSON['results'];
    setState(() {
      detailData.addAll(result);
    });

    if (detailData.isNotEmpty) {
      SelectDetailCardInfo(detailData);
    }

    return true;
  } // getJsonDatahaveCardList END

  SelectDetailCardInfo(List detailData) {
    // detailView
    showDialog(
      context: context,

      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        final mq = MediaQuery.of(context);
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(detailData[0]['sup_card_img']),
                      Text(detailData[0]['sup_category']),
                      Text(detailData[0]['sup_grade']),
                      Text(detailData[0]['sup_card_info']),
                      Text(detailData[0]['sup_Name']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Attact : ${detailData[0]['sup_ability_Attack']}'),
                          SizedBox(
                            width: mq.size.width * 0.03,
                          ),
                          Text(
                              'Defense : ${detailData[0]['sup_ability_Defense']}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HP : ${detailData[0]['sup_ability_Hp']}'),
                          SizedBox(
                            width: mq.size.width * 0.03,
                          ),
                          Text('MP : ${detailData[0]['sup_ability_Mp']}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Util 1 : ${detailData[0]['sup_ability_Util_1']}'),
                          SizedBox(
                            width: mq.size.width * 0.03,
                          ),
                          Text(
                              'Util 2 : ${detailData[0]['sup_ability_Util_2']}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
        );
      },
    );
  }
  // ----------------------- Function END -----------------------
} // END
