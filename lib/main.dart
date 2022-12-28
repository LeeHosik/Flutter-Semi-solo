import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_game_project/Login/Start.dart';
import 'package:solo_game_project/SignUp/signUp.dart';

import 'package:solo_game_project/dungeonMain/gate_dungeon.dart';
import 'package:solo_game_project/firebase_options.dart';
import 'package:solo_game_project/guild/guild_main.dart';
import 'package:solo_game_project/hometapbar.dart';
import 'package:solo_game_project/makeChara/makeCharHome.dart';

void main() async {
  // ******************************************** firebase ********************************************
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ******************************************** firebase ********************************************
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true, // <<****
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './GameStart',
      getPages: [
        GetPage(
          name: '/GameStart',
          page: () => const GameStart(),
        ),
        GetPage(
          name: '/Main_Login',
          page: () => const Guild_main(),
        ),
        GetPage(
          // 여기가 로그인 성공한 뒤에 메인 화면
          name: '/tabbar',
          page: () => const HomeTab(),
        ),
        GetPage(
          name: '/Gate_Dungeon',
          page: () => const Gate_Dungeon(),
        ),
        GetPage(
          name: '/Guild_main',
          page: () => const Guild_main(),
        ),
        GetPage(
          // 회원가입
          name: '/singUp',
          page: () => const singUp(),
        ),
        GetPage(
          // 나중에 없앨수도 있는녀석 여기서 말고 로그인 하고 난 뒤에 계정정보가 없으면 바로 넘어가도록 하고
          // 추후에 캐릭터 여러개로 할 수 있게 된다면 따로 추가해서 만들 수 있도록 해야댐
          // 근데 여러개 캐릭터 할꺼면 캐릭터롭비 창이 또 필요함
          name: '/makeCharHome',
          page: () => const makeCharHome(),
        ),
      ],
    );
  }
}
