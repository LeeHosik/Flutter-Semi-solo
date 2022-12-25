import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

class _StartBodyState extends State<StartBody> with WidgetsBindingObserver {
  late AppLifecycleState _lastLifeCycleState;
  late TextEditingController userIdController;
  late TextEditingController userPwController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    userIdController = TextEditingController();
    userPwController = TextEditingController();
    _initSharedPreferences(); // SharedPreference 초기화
  }

  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start PAge',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'start page test',
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------ Function ------------------------
  // 2022-12-25 Hosik

  Future getJsonData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    // print(response.body);
    data.clear();
    var dataConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );
    List result = dataConvertedJSON['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdController.text = (prefs.getString('DISRESU') ?? "");
      userPwController.text = (prefs.getString('WPSRESU') ?? "");
    });

    print(userIdController.text);
    print(userPwController.text);
  }

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

  _saveSharedPrefereces() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('DISRESU', userIdController.text);
    pref.setString('WPSRESU', userIdController.text);
  } // _saveSharedPrefereces END

  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  } // _disposeSharedPreferences END

  // ------------------------ Function END ------------------------
} // END

