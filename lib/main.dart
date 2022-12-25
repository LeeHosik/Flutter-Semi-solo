import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_game_project/Login/start.dart';
import 'package:solo_game_project/dungeonMain/gate_dungeon.dart';
import 'package:solo_game_project/guild/guild_main.dart';
import 'package:solo_game_project/hometapbar.dart';

void main() {
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
      initialRoute: './Start',
      getPages: [
        GetPage(
          name: '/Start',
          page: () => const Start(),
        ),
        GetPage(
          name: '/Main_Login',
          page: () => const Guild_main(),
        ),
        GetPage(
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
      ],
    );
  }
}
