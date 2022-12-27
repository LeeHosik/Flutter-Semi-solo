import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class singUp extends StatelessWidget {
  const singUp({super.key});

  @override
  Widget build(BuildContext context) {
    return singUpBody();
  }
}

class singUpBody extends StatefulWidget {
  const singUpBody({super.key});

  @override
  State<singUpBody> createState() => _singUpBodyState();
}

class _singUpBodyState extends State<singUpBody> {
  late TextEditingController inputsignUpUserId;
  late TextEditingController inputsignUpUserPw;
  late TextEditingController inputsignUpUserEmail;

  late String singUpId;
  late String singUpPw;
  late String singUpEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputsignUpUserId = TextEditingController();
    inputsignUpUserPw = TextEditingController();
    inputsignUpUserEmail = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sing Up',
            ),
            TextField(
              controller: inputsignUpUserId,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your ID',
              ),
              textInputAction: TextInputAction.go,
            ),
            TextField(
              controller: inputsignUpUserPw,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your ID',
              ),
              textInputAction: TextInputAction.go,
            ),
            TextField(
              controller: inputsignUpUserEmail,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your E-mail',
              ),
              textInputAction: TextInputAction.go,
            ),
            ElevatedButton(
              onPressed: () {
                singUpId = inputsignUpUserId.text.trim();
                singUpPw = inputsignUpUserPw.text.trim();
                singUpEmail = inputsignUpUserEmail.text.trim();
                getJsonDataSignUp(singUpId, singUpPw, singUpEmail);
              },
              child: const Text(
                'Sing Up!',
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ----------- Function -------------

  Future getJsonDataSignUp(
      String inputId, String inputPw, String inputEmail) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/SignUp/signUp.jsp?inputId=$inputId&inputPw=$inputPw&inputEmail=$inputEmail');

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
              '회원가입 완료!',
            ),
            content: const Text('complete'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.back();
                  //Get.toNamed('/tabbar');
                },
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  }
  // ----------- Function END -------------
}// END
