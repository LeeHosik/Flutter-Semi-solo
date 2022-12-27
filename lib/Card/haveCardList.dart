import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:solo_game_project/Card/static_card.dart';
import 'package:solo_game_project/login/login_static.dart';
import 'package:http/http.dart' as http;

class haveCardList extends StatefulWidget {
  const haveCardList({super.key});

  @override
  State<haveCardList> createState() => _haveCardListState();
}

class _haveCardListState extends State<haveCardList> {
  late String ChrUID;
  late String CardCategory;
  late List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChrUID = login_static.static_charUID;
    CardCategory = card_static.card_category;
    data = [];
    print('have cardList init ChrUID = $ChrUID');
    print('have cardList init CardCategory = $CardCategory');
    getJsonDatahaveCardList(ChrUID, CardCategory);
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
          Image.network(
            data[index]['sup_card_img'],
            width: mq.size.width * 0.3,
            height: mq.size.height * 0.3,
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
    );
  } // cardBuild END

  // ----------------------- Function -----------------------
  // 2022-12-27 Hosik

  Future getJsonDatahaveCardList(String ChrUIDs, String CardCategory) async {
    String getChrUID = ChrUIDs;
    String getCategory = CardCategory;
    print(
        'haveCardList getJsonDatahaveCardList Function 안에서 static_card_category   ${card_static.card_category}');
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Card/haveCard_list.jsp?ChrUID=$getChrUID&category=$getCategory');

    var response = await http.get(url);
    print(data);
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
  } // getJsonDataLoginChk END

  // ----------------------- Function END -----------------------
} // END
