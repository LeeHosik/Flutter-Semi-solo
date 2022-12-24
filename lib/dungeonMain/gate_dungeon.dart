import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Gate_Dungeon extends StatelessWidget {
  const Gate_Dungeon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
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
    return Scaffold(
      appBar: AppBar(title: const Text('gate dungeon')),
    );
  }
}
