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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guild Main',
        ),
      ),
    );
  }
}
