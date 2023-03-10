import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/CardSQLite.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/sqlite_card_model.dart';
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
  late DatabaseHandler handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        //handler.queryUserCardDeck();
      });
    });
    // chkFirstDeck();
  }

  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context);
    return Scaffold(
      body: FutureBuilder(
        future: handler.queryUserCardDeck(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SupportCard>> snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Image.network(
                  'https://i.redd.it/bwbscwddumh61.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Positioned(
                  top: med.size.height * 0.1,
                  left: med.size.width * 0.022,
                  child: Container(
                    width: med.size.width * 0.95,
                    height: med.size.height * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: GridView.builder(
                      // itemCount: 4, //item ??????
                      itemCount: snapshot.data?.length, //item ??????
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //1 ?????? ?????? ????????? item ??????
                        childAspectRatio: 1 / 2, //item ??? ?????? 1, ?????? 2 ??? ??????
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              // SelectCardList(index + 1);
                              SupportCard.static_sup_deck_index =
                                  index.toString();
                              SelectCardList(index + 1).then(
                                (value) {
                                  setState(() {
                                    handler.queryUserCardDeck();
                                  });
                                },
                              ); // futruefh qkRnjwnrh thendmfh tkdyd
                              card_static.card_category = index % 4 == 1
                                  ? "??????"
                                  : index % 4 == 2
                                      ? "??????"
                                      : index % 4 == 3
                                          ? ""
                                          : "??????";
                            },
                            child: SizedBox(
                              height: med.size.height * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Column(
                                  //   children: [
                                  SizedBox(
                                    height: med.size.height * 0.01,
                                  ),
                                  Text(
                                    index % 4 == 1
                                        ? "??????"
                                        : index % 4 == 2
                                            ? "??????"
                                            : index % 4 == 3
                                                ? "??????"
                                                : "??????",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: med.size.height * 0.01,
                                  ),
                                  SizedBox(
                                    width: med.size.width * 0.32,
                                    height: med.size.height * 0.20,
                                    child: Image.network(
                                        snapshot.data![index].sup_card_img),
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     handler.TestDeleteCard(index);
                                  //   },
                                  //   child: const Text(
                                  //     '?????? ????????? ?????????',
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: med.size.width * 0.05,
                                  // ),
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        );
                      }, //item ??? ????????? ?????? ??????
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              // child: CircularProgressIndicator(),
              child: Image.network(
                'https://i.pinimg.com/originals/fa/6a/a8/fa6aa8b9f02691e42df56f1678e795fc.gif',
              ),
            );
          }
        },
      ),
    );
  } // build END

  // ---------------- Function ----------------

  Future SelectCardList(int GetDeckindex) async {
    // future SelectCardList(int GetDeckindex) {
    card_static.cardDeckCategory = GetDeckindex;

    showDialog(
      context: context,

      barrierDismissible: true, // ?????? ?????? ????????? ????????? ??????
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
            child: haveCardList(),
          ),
          insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
        );
      },
    ).then((value) {
      setState(() {
        handler.queryUserCardDeck();
      });
    });
  } // SelectCardList END

  // Future<bool> chkFirstDeck() async {
  //   List<SupportCard> chkFirstDeck = await handler.queryUserCardDeck();

  //   if (chkFirstDeck.isEmpty) {
  //     print('have not DATA');
  //     handler.insertFirstUserCardDeck1();
  //     handler.insertFirstUserCardDeck2();
  //     handler.insertFirstUserCardDeck3();
  //     handler.insertFirstUserCardDeck4();
  //   }
  //   // else {
  //   //   print(
  //   //       'info_supportCard.dart ?????? ?????? ????????? ???????????? ????????? ????????? ????????? ??? chkFirstDeck Function');

  //   // }
  //   return true;
  // }
  // ---------------- Function END ----------------

} // InfoInventoryBody END
