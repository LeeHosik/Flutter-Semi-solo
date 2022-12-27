import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Guild_main extends StatelessWidget {
  const Guild_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Guild_mainBody();
  }
}

class Guild_mainBody extends StatefulWidget {
  const Guild_mainBody({super.key});

  @override
  State<Guild_mainBody> createState() => _Guild_mainBodyState();
}

class _Guild_mainBodyState extends State<Guild_mainBody> {
  @override
  Widget build(BuildContext context) {
    final med = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guild Main',
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: med.size.height * 0.7,
            left: med.size.width * 0.52,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //--
                  },
                  child: const Text(
                    '길드채팅 하러 가기 준비중',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: med.size.height * 0.7,
            left: med.size.width * 0.12,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //--
                  },
                  child: const Text(
                    '길드원 보기 준비중',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
