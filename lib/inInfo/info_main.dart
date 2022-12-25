import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoMain extends StatelessWidget {
  const InfoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoMainBody();
  }
}

class InfoMainBody extends StatefulWidget {
  const InfoMainBody({super.key});

  @override
  State<InfoMainBody> createState() => _InfoMainBodyState();
}

class _InfoMainBodyState extends State<InfoMainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://i.redd.it/bwbscwddumh61.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Stack(),
        ],
      ),
    );
  } // build END

} // InfoInventoryBody END
