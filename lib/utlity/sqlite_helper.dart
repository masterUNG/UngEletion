import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ungelection/model/sqlite_model.dart';

class SQLiteHelper {
  final String nameDatabase = 'ungElection.db';
  final String nameTable = 'chooseTable';
  final int version = 1;

  final String colId = 'id';
  final String colIdOtp = 'idOtp';
  final String colChoiceChooseId = 'choiceChooseId';

  SQLiteHelper() {
    initialDatabase();
  }

  Future<Null> initialDatabase() async {
    await openDatabase(
      join(await getDatabasesPath(), nameDatabase),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $nameTable ($colId INTEGER PRIMARY KEY, $colIdOtp TEXT, $colChoiceChooseId TEXT)');
      },
      version: version,
    );
  }

  Future<Database> connectedDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), nameDatabase));
  }

  Future<Null> insertValueToSQLite(SQLiteModel sqLiteModel) async {
    Database database = await connectedDatabase();
    try {
      database.insert(
        nameTable,
        sqLiteModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('####### insert Value at id = ${sqLiteModel.idOtp} Sucess #####');
    } catch (e) {}
  }

  Future<List<SQLiteModel>> readAllData() async {
    Database database = await connectedDatabase();
    List<SQLiteModel> lists = [];
    List<Map<String, dynamic>> maps = await database.query(nameTable);
    for (var item in maps) {
      SQLiteModel model = SQLiteModel.fromMap(item);
      lists.add(model);
    }
    return lists;
  }

  Future<Null> deleteAllData() async {
    Database database = await connectedDatabase();
    await database.delete(nameTable);
  }
}
