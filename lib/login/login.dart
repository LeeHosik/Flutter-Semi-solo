import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solo_game_project/login/static_user.dart';
import 'package:solo_game_project/makeChara/makeCharHome.dart';

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

class _Login_pageState extends State<Login_page> with WidgetsBindingObserver {
  late AppLifecycleState _lastLifeCycleState;
  late List data;
  late List user_login_chr_chk;
  // late String charImg;
  late TextEditingController tecUser_id;
  late TextEditingController tecUser_pw;
  late String setUser_id;
  late String setUser_pw;
  late String setUser_seq;
  late String setUser_ChrUID;

  @override
  void initState() {
    // TODO: implement initStatesetUser_ChrUID

    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // charImg = "";
    data = [];
    user_login_chr_chk = [];
    tecUser_id = TextEditingController();
    tecUser_pw = TextEditingController();
    setUser_seq = "";
    setUser_id = "";
    setUser_pw = "";
    setUser_ChrUID = "";
    _initSharedPreferences();
    setState(() {
      //
    });
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
              controller: tecUser_id,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your ID',
              ),
              textInputAction: TextInputAction.go,
            ),
            TextField(
              controller: tecUser_pw,
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
                      tecUser_id.text.trim(),
                      tecUser_pw.text.trim(),
                    );
                  },
                  child: const Text('Login!'),
                ),
              ],
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

    List result = dateConvertedJSON['results'];
    data.addAll(result);

    if (data.isNotEmpty) {
      setUser_pw = data[0]['user_pw'];
      setUser_seq = data[0]['user_seq'];
      setUser_id = data[0]['user_id'];
      getJsonDataLoginDoyouHaveChr(setUser_seq);
    } else {
      _loginFail(context);
    }
    return true;
  } // getJsonDataLoginChk END

//2022-12-28 Hosik
// login 시 캐릭터 정보가 없으면 듀토리얼로 가서 캐릭터 생성하고 난 뒤에 홈으로 가고 데이터가 있으면 바로 홈으로 가기
  Future getJsonDataLoginDoyouHaveChr(final input_user_seq) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/soloGP/Login/after_login_chk_chr.jsp?user_seq=$input_user_seq');
    var response = await http.get(url);
    data.clear();
    var dateConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );
    List result = dateConvertedJSON['results'];

    data.addAll(result);

    if (data.isEmpty) {
      setUser_ChrUID = "";
      _initSharedPreferences();
      Get.to(const makeCharHome());
    } else {
      setUser_ChrUID = data[0]['Chr_UID'];
      print(setUser_ChrUID);
      user_static.staticUser_chrUID = setUser_ChrUID;
      print(user_static.staticUser_chrUID);
      _initSharedPreferences();

      Get.back();
      Get.back();

      Get.toNamed(
        '/tabbar',
      );
    }
    return true;
  } // getJsonDataLoginDoyouHaveChr END

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

  _initSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('userId', setUser_id);
    pref.setString('userPw', setUser_pw);
    pref.setString('userSeq', setUser_seq);
    pref.setString('user_chrUID', setUser_ChrUID);
  } //  _initSharedPreferences END
  // --------------------Function END--------------------

} // END
