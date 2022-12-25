import 'package:path/path.dart';
import 'package:solo_game_project/login_sqlite_db/user_info.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    print('future<database> initializeDB #1');
    String path = await getDatabasesPath();
    print("DatabaseHandler's initializeDB access $initializeDB()");
    return openDatabase(
      join(path, 'soloGP.db'),
      onCreate: (database, version) async {
        //user_Info 라는 테이블에 UID, ID, PW 기본적으로 저장 해두고 자동 로그인 할때 초기화면에 사용
        await database.execute(
            'create table user_Info (UID integer primary key autoincrement, user_id text, user_pw text)');
      }, //없으면 만들고 있으면 넘김
      version: 1,
    );
  }

  Future<int> loginchk(user_Info user_Info) async {
    int result = 0;

    final Database db = await initializeDB();
    print("select count  Database's DB $db");
    result = await db.rawInsert('select count(*) from user_Info');
    return result;
  } // insertStudents END

  Future<int> insertuser_Info(user_Info user_Info) async {
    int result = 0;

    final Database db = await initializeDB();
    print("insertStudents Database's DB $db");
    result = await db.rawInsert(
        'insert into student (UID, user_id, user_pw) value (?,?,?)', [
      user_Info.UID,
      user_Info.user_id,
      user_Info.user_pw,
    ]);
    return result;
  } // insertStudents END

  Future<List<user_Info>> queryStudents() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from user_Info');
    return queryResult.map((e) => user_Info.fromMap(e)).toList();
  } // queryStudent END

} // DatabaseHandler END
