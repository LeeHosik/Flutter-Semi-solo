import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_game_project/Card/haveCardList.dart';
import 'package:solo_game_project/Card/static_card.dart';

class InfoSupportCard extends StatelessWidget {
  const InfoSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoSupportCardBody();
  }
}

class InfoSupportCardBody extends StatefulWidget {
  const InfoSupportCardBody({super.key});

  @override
  State<InfoSupportCardBody> createState() => _InfoSupportCardBodyState();
}

class _InfoSupportCardBodyState extends State<InfoSupportCardBody> {
  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        body: Stack(
          children: [
            // app background img
            Image.network(
              'https://i.redd.it/bwbscwddumh61.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: med.size.height * 0.1,
              left: med.size.width * 0.1,
              child: Container(
                width: med.size.width * 0.8,
                height: med.size.height * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    card_static.card_category = '0';
                                    SelectCardList();
                                    print(
                                        'have Card List 에서 onLongPress  ${card_static.card_category}');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: med.size.width * 0.3,
                                      child: Image.network(
                                        card_static.used_card_one,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: med.size.height * 0.03,
                                  left: med.size.width * 0.1,
                                  child: const Text(
                                    '공격카드',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: med.size.width * 0.3,
                                child: Image.network(
                                  card_static.used_card_two,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: med.size.width * 0.3,
                                    child: Image.network(
                                      card_static.used_card_three,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: med.size.width * 0.3,
                                    child: Image.network(
                                      card_static.used_card_four,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // build END

  // ---------------- Function ----------------

  SelectCardList() {
    showDialog(
      context: context,

      barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: haveCardList(),
          ),
          insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
          actions: [
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Get.back();
              },
            ),
            //   TextButton(
            //     child: const Text('확인'),
            //     onPressed: () {
            //       Get.back();
            //     },
            //   ),
          ],
        );
      },
    );
  }

  // ---------------- Function END ----------------

} // InfoInventoryBody END
