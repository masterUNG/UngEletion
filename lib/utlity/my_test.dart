import 'package:ungelection/utlity/sqlite_helper.dart';

class MyTest {
  Future<Null> readSQLite() async {
    await SQLiteHelper().readAllData().then((value) {
      print('ขนาดของ SQLite ==>> ${value.length}');
    });
  }
}