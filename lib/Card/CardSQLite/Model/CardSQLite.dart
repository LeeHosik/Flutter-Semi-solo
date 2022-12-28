import 'package:path/path.dart';
import 'package:solo_game_project/Card/CardSQLite/Model/sqlite_card_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  // Dao랑 비슷하다고 보면 된다.
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'InstanceEquipCard.db'),
      onCreate: (database, version) async {
        await database.execute(
          // sup_table_group 은 추후 덱을 여러개 만들 수 있게 업데이트 할때 사용할 덱넘버
          "create table EquipCard(sup_seq integer primary key , sup_name text, sup_category text, sup_grade text, sup_card_img text , sup_table_group text)",
        );
      },
      version: 1,
    );
  }

  Future<int> updateUserCardDeck(SupportCard SupportCard) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawUpdate(
        'update EquipCard set sup_name = ?, sup_category = ?, sup_grade = ?, sup_card_img = ? where sup_seq = ?',
        [
          SupportCard.sup_name,
          SupportCard.sup_category,
          SupportCard.sup_grade,
          SupportCard.sup_card_img,
          SupportCard.sup_seq,
        ]);

    return result;
  }

// default 'https://mblogthumb-phinf.pstatic.net/MjAyMDAzMTNfMjMw/MDAxNTg0MDMyMzAzMDU0.FsCYZc2DasH1M9PUdxAkTGVHV2_OtHHCGUh6Ojdk7Fog.Sb-5R2ciDEGMUlUC9vSGP5q9hXvsADSY6avDjxx2H-0g.PNG.lds5209/image.png?type=w800'
// ------
  Future<int> insertFirstUserCardDeck1() async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into EquipCard(sup_seq, sup_name, sup_category, sup_grade, sup_card_img) values(?,?, ?, ?, ?)',
      [
        '1',
        '메지로 아르당',
        '공격',
        'R',
        'https://gametora.com/images/umamusume/supports/tex_support_card_10069.png'
      ],
    );

    return result;
  }

  Future<int> insertFirstUserCardDeck2() async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into EquipCard(sup_seq,sup_name, sup_category, sup_grade, sup_card_img) values(?,?, ?, ?, ?)',
      [
        '2',
        '토도',
        '방어',
        'R',
        'https://gametora.com/images/umamusume/supports/tex_support_card_30079.png'
      ],
    );

    return result;
  }

  Future<int> insertFirstUserCardDeck3() async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into EquipCard(sup_seq,sup_name, sup_category, sup_grade, sup_card_img) values(?,?, ?, ?, ?)',
      [
        '3',
        '오구리 캡',
        '유틸',
        'R',
        'https://gametora.com/images/umamusume/supports/tex_support_card_20048.png'
      ],
    );
    return result;
  }

  Future<int> insertFirstUserCardDeck4() async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into EquipCard(sup_seq, sup_name, sup_category, sup_grade, sup_card_img) values(?,?, ?, ?, ?)',
      [
        '4',
        '이쿠노 딕터스',
        '공격',
        'R',
        'https://gametora.com/images/umamusume/supports/tex_support_card_30063.png'
      ],
    );

    return result;
  }

  // Future<int> insertUserCardDeck(SupportCard SupportCard) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   result = await db.rawInsert(
  //       'insert into EquipCard(sup_name, sup_category, sup_grade, sup_card_img) values(?, ?, ?, ?)',
  //       [
  //         SupportCard.sup_name,
  //         SupportCard.sup_category,
  //         SupportCard.sup_grade,
  //         SupportCard.sup_card_img
  //       ]);

  //   return result;
  // }

  Future<List<SupportCard>> queryUserCardDeck() async {
    // DB 설정하기
    final Database db = await initializeDB();
    // KEY를 가지고와서 사용해야함.
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from EquipCard');
    return queryResult.map((e) => SupportCard.formMap(e)).toList();
  }

  // Future<int> TestDeleteCard(int sup_seq) async {
  //   int result = 0;
  //   final Database db = await initializeDB();
  //   result = await db.rawDelete(
  //     'delete from EquipCard where sup_seq = ?',
  //     [sup_seq],
  //   );

  /* 테스트용, sup_seq가 AI라서 CardList 에서 index로 받아오는 값에서는 해당 데이터가 지워지지는 않을꺼임  */

  //   return result;
  // }

  // Future<List<SupportCard>> TEST_TRUNCATE_TEST() async {
  //   // DB 설정하기
  //   final Database db = await initializeDB();
  //   // KEY를 가지고와서 사용해야함.
  //   final List<Map<String, Object?>> queryResult =
  //       await db.rawQuery('TRUNCATE EquipCard');
  //   return queryResult.map((e) => SupportCard.formMap(e)).toList();
  // }

  /* 테스트용 */

} // END
