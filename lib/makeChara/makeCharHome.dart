import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo_game_project/home.dart';
import 'package:solo_game_project/login/static_user.dart';
import 'package:solo_game_project/makeChara/makeCharInfoClass.dart';
import 'package:http/http.dart' as http;
import 'package:solo_game_project/makeChara/tutorial.dart';

class makeCharHome extends StatelessWidget {
  const makeCharHome({super.key});

  @override
  Widget build(BuildContext context) {
    return makeCharHomeBody();
  }
}

class makeCharHomeBody extends StatefulWidget {
  const makeCharHomeBody({super.key});

  @override
  State<makeCharHomeBody> createState() => _makeCharHomeBodyState();
}

class _makeCharHomeBodyState extends State<makeCharHomeBody> {
  late String img;
  late List<CardItem> imgitems;
  late TextEditingController charName;
  late int charNum;
  late String userSeq;
  late String inputChrName;
  late List data;
  late String user_chrUID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    charName = TextEditingController();
    imgitems = makeCharList.imgitems;
    userSeq = "";
    user_chrUID = '';
    _initSharedPreferences();
    charNum = 2;

    img =
        'https://static.wikia.nocookie.net/umamusume/images/8/8e/KitasanblackSecondary.png/revision/latest?cb=20210921112445';
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://p4.wallpaperbetter.com/wallpaper/748/498/513/sky-mountains-portrait-display-night-wallpaper-preview.jpg',
            fit: BoxFit.cover,
            width: mq.size.width,
            height: mq.size.height,
          ),
          Positioned(
            top: mq.size.height * 0.15,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: mq.size.height * 0.8,
                  width: mq.size.width * 1.4,
                  child: HorizontalCardPager(
                    onPageChanged: (page) {
                      setState(() {
                        changeImg(page);
                      });
                    },
                    onSelectedItem: (page) {
                      setState(() {
                        changeImg(page);
                      });
                    },
                    items: imgitems,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: mq.size.height * 0.37,
            left: mq.size.width * 0.18,
            child: Column(
              children: [
                CircleAvatar(
                  radius: mq.size.width * 0.3,
                  backgroundImage: NetworkImage(img),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
          ),
          Positioned(
            top: mq.size.height * 0.8,
            left: mq.size.width * 0.25,
            child: SizedBox(
              width: mq.size.width * 0.5,
              height: mq.size.height * 0.1,
              child: TextField(
                controller: charName,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Input Name',
                ),
              ),
            ),
          ),
          Positioned(
            top: mq.size.height * 0.9,
            left: mq.size.width * 0.425,
            child: SizedBox(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (charName.text.isEmpty) {
                        CheckIDisEmpty();
                      } else {
                        inputChrName = charName.text.trim();

                        getJsonDatamakeChar(inputChrName, charNum);
                      }

                      //  makeChar(charName.text.trim(), charNum);
                    },
                    child: const Text(
                      'OK',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------- Function -----------------

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userSeq = (prefs.getString('userSeq'))!;
      prefs.setString('user_chrUID', user_chrUID);
    });
  } //  _initSharedPreferences END

  // 2022-12-26 Hosik
  changeImg(value) {
    if (value >= 3) {
      charNum = 3; // 재퍼
      img =
          "https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Yamanin%20Zephyr.png?raw=true";
    } else if (value < 3 && value >= 2) {
      charNum = 2; // 키타산
      img =
          "https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Kitasan%20Black.png?raw=true";
    } else if (value < 2 && value >= 1) {
      charNum = 1; // 서다홍
      img =
          "https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Daiwa%20Scarlet.png?raw=true";
    } else if (value < 1 && value >= 0) {
      charNum = 0; // 마짱
      img =
          "https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Aston%20Machan.png?raw=true";
    }
  } // changeImg END

  CheckIDisEmpty() {
    // 아이디 없이 눌렀을때 경고 창
    showDialog(
      context: context,

      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.05,
            child: const Center(
              child: Text('아이디를 입력해 주세요'),
            ),
          ),
        );
      },
    );
  }

  //////
  Future getJsonDataMakeChr_GetUID() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Tutorial/makeUserChrUID.jsp?user_seq=$userSeq');
// 만든 캐릭터가 얻은 Chr_UID 값 찾아서 static에 저장
    var response = await http.get(url);

    data.clear();
    var dateConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    List result = dateConvertedJSON['results'];
    data.addAll(result);
    print(data[0]['Chr_UID']);
    user_chrUID = data[0]['Chr_UID'];
    user_static.staticUser_chrUID = user_chrUID;
    if (data.isNotEmpty) {
      //getJsonDatamakeChar(inputChrName, charNum);
      Get.to(
        const Tutorial(),
      );
    } else {
      // _loginFail(context);
      print('좆됬따. 만든 캐릭터의 UID 값을 못가져 오고 있다 ');
    }
    return true;
  } // getJsonDataLoginChk END

  /////

  Future getJsonDatamakeChar(String charName, int charNum) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/MakeCharac/makeChar_insert.jsp?charName=$charName&charNum=$charNum&user_seq=$userSeq');
// 캐릭터 만들고 듀토리얼 끝나고 캐릭 생성
    var response = await http.get(url);
    _showDialog(context);
    return true;
  } // getJsonDatamakeChar END

  _showDialog(context) {
    // 캐릭터 생성 성공, 게임 메인으로 넘어가기
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              '캐릭터 생성완료',
            ),
            content: const Text('듀토리얼로 넘어가요~'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  getJsonDataMakeChr_GetUID();
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  } //_showDialog END

  // ----------------- Function END -----------------
} // END
