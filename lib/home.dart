import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/CardSQLite.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/sqlite_card_model.dart';
import 'package:solo_game_project/notice/notice.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late String userSeq;
  late String character;
  late List data;
  late String test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userSeq = '';
    _initSharedPreferences();

    character =
        "https://i.pinimg.com/originals/fa/6a/a8/fa6aa8b9f02691e42df56f1678e795fc.gif";

    // getJsonDataGetUserCharInit(userSeq);
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(title: const Text('Home')),
      body: Stack(
        children: [
          Image.network(
            'https://p4.wallpaperbetter.com/wallpaper/748/498/513/sky-mountains-portrait-display-night-wallpaper-preview.jpg',
            fit: BoxFit.cover,
            width: Mwidth,
            height: MHeight - 55,
          ),
          Positioned(
            top: (MHeight - 55) * 0.2,
            left: Mwidth * 0.25,
            child: SizedBox(
              child: Image.network(
                character,
                height: MHeight * 0.5,
                width: Mwidth * 0.5,
              ),
            ),
          ),
          Positioned(
            top: (MHeight - 55) * 0.8,
            left: Mwidth * 0.05,
            child: SizedBox(
              child: SizedBox(
                width: Mwidth * 0.25,
                height: MHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/Guild_main');
                  },
                  child: const Text(
                    'Guild',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MHeight - 55) * 0.8,
            left: Mwidth * 0.375,
            child: SizedBox(
              child: SizedBox(
                width: Mwidth * 0.25,
                height: MHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/Gate_Dungeon');
                  },
                  child: const Text(
                    'Move Dungeon',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MHeight - 55) * 0.8,
            left: Mwidth * 0.705,
            child: SizedBox(
              child: SizedBox(
                width: Mwidth * 0.25,
                height: MHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    ClickedNotice();
                  },
                  child: const Text(
                    'Notice',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------- Function -------------
//2022-12-28 Hosik
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // userId = (prefs.getString('userId'))!;
      // userPw = (prefs.getString('userPw'))!;
      userSeq = (prefs.getString('userSeq'))!;
      print('<<<<<<<<Home get sharedPreferences userSEQ>>>>>>>>');
      print(userSeq);
      getJsonDataGetUserCharInit(userSeq);
      // user_chrUID = (prefs.getString('user_chrUID'))!;
    });
  } //  _initSharedPreferences END

  // 2022-12-24 Hosik
  ClickedNotice() {
    // notice 클릭시 웹뷰
    showDialog(
      context: context,

      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: const Notice_main(),
          ),
        );
      },
    );
  }

//2022-12-27 Hosik

  //초기 유저 정보로 캐릭터이미지 정보 가져오기
  Future getJsonDataGetUserCharInit(String userSeq) async {
    print('//초기 유저 정보로 캐릭터이미지 정보 가져오기');
    print(userSeq);
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/HomeInit/HomeInit.jsp?user_seq=$userSeq');
//select chrImg from basicCharInfo where basicChrSeq =  (select basicCharInfo_basicCahrSeq from Characters where User_user_seq = '" + user_seq + "')";
// basicCharInfo 에서 char img 불러오기
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
    print('home dptj 메인으로 캐릭터 불러오기 함수 ');
    print(data);
    if (data.isNotEmpty) {
      setState(() {
        character = data[0]['charImg'];
      });
    } else {
      CantGetCharImg();

      return true;
    } // getJsonDataLoginChk END
  }

  CantGetCharImg() {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('불러오기 실패'),
          content: const Text('에러가 발생하였습니다. 게임을 다시 실행해 주세요 '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(ctx).pop();
                Navigator.of(ctx).pop();
                Navigator.of(ctx).pop();
              },
              child: const Text(' 뒤로가기 '),
            ),
          ],
        );
      },
    );
  }

  // ------------- Function END -------------
} // END
