import 'package:flutter_assignment/models/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'mydata.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE data(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, "
          "mobile_no TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertData(data _data) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('data', _data.toMap());

    return result;
  }

  Future<List<data>> retrieveData() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('data');

    return queryResult.map((e) => data.fromMap(e)).toList();
  }

  Future<void> deleteData(int id) async {
    final db = await initializeDB();
    await db.delete(
      'data',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
