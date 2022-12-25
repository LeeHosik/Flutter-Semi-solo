import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gate_Dungeon extends StatelessWidget {
  const Gate_Dungeon({super.key});

  @override
  Widget build(BuildContext context) {
    return Gate_DungeonBody();
  }
}

class Gate_DungeonBody extends StatefulWidget {
  const Gate_DungeonBody({super.key});

  @override
  State<Gate_DungeonBody> createState() => _Gate_DungeonBodyState();
}

class _Gate_DungeonBodyState extends State<Gate_DungeonBody> {
  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Image.network(
                  'https://i.redd.it/uavs52iugfn71.jpg',
                  fit: BoxFit.cover,
                  width: med.size.width,
                  height: med.size.height,
                ),
                Positioned(
                  top: (med.size.height) * 0.1,
                  left: med.size.width * 0.1,
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        '뒤로가기',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: (med.size.height) * 0.8,
                  left: med.size.width * 0.7,
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () => ClickedStage(),
                      child: const Text(
                        'Stage 1',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: (med.size.height) * 0.7,
                  left: med.size.width * 0.2,
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () => ClickedStage(),
                      child: const Text(
                        'Stage 2',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: (med.size.height) * 0.6,
                  left: med.size.width * 0.65,
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () => ClickedStage(),
                      child: const Text(
                        'Stage 3',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// --------- Function
// 2022-12-24 Hosik

  ClickedStage() {
    showDialog(
      context: context,

      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.5,
            child: StageMainInfo(),
          ),
          //insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
          actions: [
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

//

} // END

class StageMainInfo extends StatefulWidget {
  const StageMainInfo({super.key});

  @override
  State<StageMainInfo> createState() => _StageMainInfoState();
}

class _StageMainInfoState extends State<StageMainInfo> {
  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.dangerous),
                Text(
                  '  Stage1',
                ),
              ],
            ),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      child: Image.network(
                        width: med.size.height * 0.2,
                        'https://w7.pngwing.com/pngs/589/740/png-transparent-goblin-illustration-clash-of-clans-clash-royale-jareth-goblin-game-coc-game-fictional-character-action-figure-thumbnail.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      child: Image.network(
                        width: med.size.height * 0.2,
                        'https://w7.pngwing.com/pngs/589/740/png-transparent-goblin-illustration-clash-of-clans-clash-royale-jareth-goblin-game-coc-game-fictional-character-action-figure-thumbnail.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: med.size.height * 0.02,
            ),
            const Text(
              '나오는 적 ',
            ),
            const Text(
              '고블린 x2',
            ),
            SizedBox(
              height: med.size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '획득 가능 경험치 : 100',
                ),
                Text(
                  '획득 가능 아이템',
                ),
              ],
            ),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: med.size.height * 0.15,
                      child: Image.network(
                        'https://w7.pngwing.com/pngs/979/38/png-transparent-sword-weapon-swords-photography-dagger-japanese-sword.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: med.size.height * 0.15,
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQorARCY_7UNVgFObr85Y4uf3GD8qVqdEdaqw&usqp=CAU',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
