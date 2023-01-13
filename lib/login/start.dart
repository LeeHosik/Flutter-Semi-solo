import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:solo_game_project/Login/login.dart';
import 'package:solo_game_project/SignUp/signUp.dart';
import 'package:solo_game_project/hometapbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solo_game_project/login/google_login.dart';

class GameStart extends StatelessWidget {
  const GameStart({super.key});

  @override
  Widget build(BuildContext context) {
    return StartBody();
  }
}

class StartBody extends StatefulWidget {
  const StartBody({super.key});

  @override
  State<StartBody> createState() => _StartBodyState();
}

class _StartBodyState extends State<StartBody> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   GoogleSignIn _googleSignIn = GoogleSignIn(
  //     scopes: [
  //       'email',
  //       'https://www.googleapis.com/auth/contacts.readonly',
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // double MHeight = MediaQuery.of(context).size.height;
    // double Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start PAge',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => GotoLogin(),
              child: const Text(
                'Go to Login',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const singUp(),
                );
              },
              child: const Text(
                'Go to Sign Up',
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(const SampleScreen()),
              child: const Text(
                'XXXXXXXX google just iso and XXXXXXXX',
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(const SampleScreen()),
              child: const Text(
                'google Login(Feat.Firebase)',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------ Function ------------------------
  // 2022-12-25 Hosik

  GotoLogin() {
    showDialog(
      context: context,

      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.4,
              child: const Login_main(),
            ),
          ),
        );
      },
    );
  }

  loginsucess() {
// const HomeTab();
    Get.toNamed(
      '/tabbar',
      // arguments: data[0]['user_seq'],
    );
  }

  // Future<int> loginChk() async {
  //   user_Info getUserInfo = user_Info(
  //     UID: '',
  //     user_id: 'user_id',
  //     user_pw: 'user_pw',
  //   );
  // } //loginChk

  // Future getJsonData() async {
  //   var url =
  //       Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
  //   var response = await http.get(url);
  //   // print(response.body);
  //   data.clear();
  //   var dataConvertedJSON = json.decode(
  //     utf8.decode(
  //       response.bodyBytes,
  //     ),
  //   );
  //   List result = dataConvertedJSON['results'];
  //   setState(() {
  //     data.addAll(result);
  //   });
  //   return true;
  // }

  // _initSharedPreferences() async { // 일반앱에서 아이디랑 비밀번호 저장하기 하는거
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userIdController.text = (prefs.getString('DISRESU') ?? "");
  //     userPwController.text = (prefs.getString('WPSRESU') ?? "");
  //   });

  //   print(userIdController.text);
  //   print(userPwController.text);
  // }

  // _showDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('hello'),
  //           content: const Text('check your account'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 _saveSharedPrefereces();
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) {
  //                       return const SecondPage();
  //                     },
  //                   ),
  //                 );
  //               },
  //               child: const Text(
  //                 'OK',
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // } //_showDialog END

  // _saveSharedPrefereces() async {
  //   final pref = await SharedPreferences.getInstance();
  //   pref.setString('DISRESU', userIdController.text);
  //   pref.setString('WPSRESU', userIdController.text);
  // } // _saveSharedPrefereces END

  // _disposeSharedPreferences() async {
  //   final pref = await SharedPreferences.getInstance();
  //   pref.clear();
  // } // _disposeSharedPreferences END

  // ------------------------ Function END ------------------------
} // END
