import 'package:flutter/material.dart';

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
                height: med.size.height * 0.75,
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: med.size.width * 0.3,
                                    child: Image.network(
                                      'https://cdn.discordapp.com/attachments/1031213057088688139/1056153341643739196/SSR_Speed_.png',
                                      fit: BoxFit.fill,
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
                                  'https://cdn.discordapp.com/attachments/1031213057088688139/1056153341991858197/SSR_Speed_.png',
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
                                      'https://cdn.discordapp.com/attachments/1031213057088688139/1056153342432268328/8b193e6c502e248b.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: med.size.width * 0.3,
                                    child: Image.network(
                                      'https://cdn.discordapp.com/attachments/1031213057088688139/1056153342792970240/SSR_Speed_.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: med.size.height * 0.1,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: med.size.width * 0.3,
                                  child: Image.network(
                                    'https://cdn.discordapp.com/attachments/1031213057088688139/1056153342432268328/8b193e6c502e248b.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: med.size.width * 0.3,
                                  child: Image.network(
                                    'https://cdn.discordapp.com/attachments/1031213057088688139/1056153342792970240/SSR_Speed_.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: med.size.width * 0.3,
                                  child: Image.network(
                                    'https://cdn.discordapp.com/attachments/1031213057088688139/1056153342432268328/8b193e6c502e248b.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: med.size.width * 0.3,
                                  child: Image.network(
                                    'https://cdn.discordapp.com/attachments/1031213057088688139/1056153342792970240/SSR_Speed_.png',
                                    fit: BoxFit.fill,
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

} // InfoInventoryBody END
