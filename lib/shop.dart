import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return ShopBody();
  }
}

class ShopBody extends StatefulWidget {
  const ShopBody({super.key});

  @override
  State<ShopBody> createState() => _ShopBodyState();
}

class _ShopBodyState extends State<ShopBody> {
  late String text;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = lorem(paragraphs: 30, words: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop ',
        ),
      ),
      // body:
    );
  }
}
