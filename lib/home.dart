import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_game_project/hometapbar.dart';
import 'package:solo_game_project/notice/notice.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double MHeight = MediaQuery.of(context).size.height;
    double Mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(title: const Text('Home')),
      body:
          // Center(
          //   child: Column(
          //     children: [
          Stack(
        children: [
          Image.network(
            'https://p4.wallpaperbetter.com/wallpaper/748/498/513/sky-mountains-portrait-display-night-wallpaper-preview.jpg',
            fit: BoxFit.cover,
            width: Mwidth,
            height: MHeight - 55,
          ),
          Positioned(
            top: (MHeight - 55) * 0.2,
            left: Mwidth * 0.25,
            child: SizedBox(
              child: Image.network(
                'https://static.wikia.nocookie.net/umamusume/images/8/8e/KitasanblackSecondary.png/revision/latest?cb=20210921112445',
                height: MHeight * 0.5,
                width: Mwidth * 0.5,
              ),
            ),
          ),
          Positioned(
            top: (MHeight - 55) * 0.8,
            left: Mwidth * 0.05,
            child: SizedBox(
              child: SizedBox(
                width: Mwidth * 0.25,
                height: MHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/Guild_main');
                  },
                  child: const Text(
                    'Guild',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MHeight - 55) * 0.8,
            left: Mwidth * 0.375,
            child: SizedBox(
              child: SizedBox(
                width: Mwidth * 0.25,
                height: MHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/Gate_Dungeon');
                  },
                  child: const Text(
                    'Move Dungeon',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MHeight - 55) * 0.8,
            left: Mwidth * 0.705,
            child: SizedBox(
              child: SizedBox(
                width: Mwidth * 0.25,
                height: MHeight * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    ClickedNotice();
                  },
                  child: const Text(
                    'Notice',
                  ),
                ),
              ),
            ),
          ),
        ],
        //     ),
        //   ],
        // ),
      ),
    );
  }

  // ------------- Function -------------
  // 2022-12-24 Hosik
  ClickedNotice() {
    showDialog(
      context: context,

      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            child: const Notice_main(),
          ),
        );
      },
    );
  }
}// END
