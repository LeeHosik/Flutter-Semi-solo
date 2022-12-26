import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';

class makeCharList {
  static List<CardItem> imgitems = [
    ImageCarditem(
      image: Image.network(
        // 마쨩
        'https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Aston%20Machan.png?raw=true',
      ),
    ),
    ImageCarditem(
      image: Image.network(
        //서다홍
        'https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Daiwa%20Scarlet.png?raw=true',
      ),
    ),
    ImageCarditem(
      image: Image.network(
        //키타산
        'https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Kitasan%20Black.png?raw=true',
      ),
    ),
    ImageCarditem(
      image: Image.network(
        // 재퍼
        'https://github.com/LeeHosik/Flutter-Study/blob/main/00%20backup/study/images/Yamanin%20Zephyr.png?raw=true',
      ),
    ),
  ];
}
