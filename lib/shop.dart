import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop ',
        ),
      ),
      body: Center(
        child: const Text(
          '준비중',
        ),
      ),
    );
  }
}
