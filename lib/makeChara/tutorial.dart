import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo_game_project/login/static_user.dart';
import 'package:solo_game_project/makeChara/makeCharHome.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return TutorialBody();
  }
}

class TutorialBody extends StatefulWidget {
  const TutorialBody({super.key});

  @override
  State<TutorialBody> createState() => _TutorialBodyState();
}

class _TutorialBodyState extends State<TutorialBody> {
  late String user_chrUID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_chrUID = user_static.staticUser_chrUID;
    print(user_static.staticUser_chrUID);
    print('>>>>>>>>');
    print('init state tutorial user chrUID = $user_chrUID');

    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial Page',
        ),
      ),
      body: ElevatedButton(
        onPressed: () {
          print('onPress user_chrUID  =>>>$user_chrUID');
          getJsonData_FinTutorial(user_chrUID);
        },
        child: const Text('튜토리얼 완료! 게임 시작하기 !'),
      ),
      // tutorial 을 끝내면 인벤토리와 초기 서포트카드 인벤토리를 캐릭터UID 값으로 생성.
    );
  }
  // -------------- Function --------------

  //2022-12-29 HOsik
  _initSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();

    pref.setString('user_chrUID', user_chrUID);
  } //  _initSharedPreferences END

  Future getJsonData_FinTutorial(String userUID) async {
    print('Tutorial Finish userChrUID = $userUID');
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Tutorial/Tutorial.jsp?user_chrUID=$userUID');
    // 이 jsp 가 듀토리얼 끝나고 기초카드 주는 녀석
    var response = await http.get(url);
    _showDialog(context);
    return true;
  } // getJsonDatamakeChar END

  _showDialog(context) {
    //튜토리얼 완료 알람창
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              '튜토리얼 종료!',
            ),
            content: const Text('complete'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.back();
                  Get.toNamed('/tabbar');
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  }
  // -------------- Function END --------------
} // END
