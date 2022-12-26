import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:solo_game_project/login/login_static.dart';
import 'package:solo_game_project/makeChara/makeCharInfoClass.dart';
import 'package:http/http.dart' as http;

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
  late String user_seq;
  late String inputChrName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    charName = TextEditingController();
    imgitems = makeCharList.imgitems;
    user_seq = login_static.static_user_seq;
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

  Future getJsonDatamakeChar(String charName, int charNum) async {
    print(charName);
    print(charNum);
    print(user_seq);
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/makeChar_insert.jsp?charName=$charName&charNum=$charNum&user_seq=$user_seq');

    var response = await http.get(url);
    return true;
  } // getJsonDatamakeChar END

  // ----------------- Function END -----------------
} // END
