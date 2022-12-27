import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial Page',
        ),
      ),
      // tutorial 을 끝내면 인벤토리와 초기 서포트카드 인벤토리를 캐릭터UID 값으로 생성.
    );
  }
  // -------------- Function --------------

  Future getJsonData_FinTutorial(String userUID) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Tutorial/Tutorial.jsp?userUID=$userUID');

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
