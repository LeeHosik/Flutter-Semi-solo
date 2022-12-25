import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notice_main extends StatelessWidget {
  const Notice_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Notice_mainBody();
  }
}

class Notice_mainBody extends StatefulWidget {
  const Notice_mainBody({super.key});

  @override
  State<Notice_mainBody> createState() => _Notice_mainBodyState();
}

class _Notice_mainBodyState extends State<Notice_mainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35.0),
        child: AppBar(
          title: const Text(
            'Notice',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '준비중 입니다.',
            ),
            Text(
              'https://cafe.naver.com/luchesia 으로 연동에정',
            ),
          ],
        ),
      ),
    );
  }
}
