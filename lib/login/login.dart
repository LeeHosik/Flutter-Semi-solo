import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:solo_game_project/login/login_static.dart';

class Login_main extends StatelessWidget {
  const Login_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Login_page();
  }
}

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  late List data;
  late String sendSeq;
  late String charImg;
  late TextEditingController user_id;
  late TextEditingController user_pw;
  // late var sucess;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    charImg = "";
    data = [];
    user_id = TextEditingController();
    user_pw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: user_id,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your ID',
              ),
              textInputAction: TextInputAction.go,
            ),
            TextField(
              controller: user_pw,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your PW',
              ),
              textInputAction: TextInputAction.go,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/singUp');
                  },
                  child: const Text('회원가입 하러 가기'),
                ),
                SizedBox(
                  width: med.size.width * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    getJsonDataLoginChk(
                      user_id.text.trim(),
                      user_pw.text.trim(),
                    );
                  },
                  child: const Text('Login!'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                testFunctionDesu(
                  user_id.text.trim(),
                  user_pw.text.trim(),
                );
              },
              child: const Text('로그인 한 뒤에 캐릭터생성으로 가는 임시버튼'),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------- Function --------------------

  Future getJsonDataLoginChk(final input_user_id, final input_user_pw) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Login/login_chk_query.jsp?user_id=$input_user_id&user_pw=$input_user_pw');

    var response = await http.get(url);

    data.clear();
    var dateConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    print(response.body);
    List result = dateConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });

    if (data.isNotEmpty) {
      String sendSeq = data[0]['user_seq'];
      login_static.static_charUID = data[0]['char_UID'];

      Get.back();
      Get.back();
      Get.toNamed(
        '/tabbar',
        arguments: data[0]['user_seq'],
      );

      //suceess login

    } else {
      _loginFail(context);
    }
    return true;
  } // getJsonDataLoginChk END

  _loginFail(BuildContext context) {
    // 로그인 실패시
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('로그인 실패'),
          content: const Text('아이디와 비밀번호를 다시 확인해 주세요'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(' 뒤로가기 '),
            ),
          ],
        );
      },
    );
  } // _showDialog END

  // --------------------Function END--------------------

// ****************임시 테스트 위한 로그인 한뒤 캐릭생성 바로 가는 펑션 지울 예정 ************************

  Future testFunctionDesu(final input_user_id, final input_user_pw) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Login/login_chk_query.jsp?user_id=$input_user_id&user_pw=$input_user_pw');

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

    if (data.isNotEmpty) {
      print(data[0]['user_seq']);
      login_static.static_user_seq = data[0]['user_seq'];
      print('스태틱에 들어간 유저 아이디 ${login_static.static_user_seq}');
      Get.back();
      Get.back();
      Get.toNamed('/makeCharHome');

      //suceess login

    } else {
      _loginFail(context);
    }
    return true;
  } // getJsonDataLoginChk END

  // ****************임시 테스트 위한 로그인 한뒤 캐릭생성 바로 가는 펑션 지울 예정 ************************
} // END
