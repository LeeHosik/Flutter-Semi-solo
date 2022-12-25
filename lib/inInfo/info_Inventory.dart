import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoInventory extends StatelessWidget {
  const InfoInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoInventoryBody();
  }
}

class InfoInventoryBody extends StatefulWidget {
  const InfoInventoryBody({super.key});

  @override
  State<InfoInventoryBody> createState() => _InfoInventoryBodyState();
}

class _InfoInventoryBodyState extends State<InfoInventoryBody> {
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
