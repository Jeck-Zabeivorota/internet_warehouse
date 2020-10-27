import 'package:sqflite/sqflite.dart';

class DB {
  static Database db;

  static Future<void> init() async {
    if (db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'Data.db';
      print(_path);
      db = await openDatabase(_path, version: 1, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database _db, int version) async => await db.execute('''
  CREATE TABLE Clients (
    email STRING PRIMARY KEY,
    password STRING,
    fullName BOOLEAN,
    addres STRING,
    phone STRING,
    numberOfOrders INTEGER
  )
  ''');

  static Future<List<Map<String, dynamic>>> queryAll(String table) async =>
      await db.query(table);

  static Map<String, dynamic> queryOne(
      String table, String key, String checkValue) {
    Map<String, dynamic> map = {};
    db.query(table).then((list) {
      print(list);
      if (list == null) return;
      for (int x = 0; x < list.length; ++x) {
        if (list[x][key] == checkValue) {
          map = list[x];
          break;
        }
      }
    });
    return map;
  }

  static Future<int> insert(String table, Map<String, dynamic> data) async =>
      await db.insert(table, data);

  static Future<int> update(
          String table, String key, Map<String, dynamic> data) async =>
      await db.update(table, data, where: '$key = ?', whereArgs: [data[key]]);

  static Future<int> delete(String table, String key, String data) async =>
      await db.delete(table, where: '$key = ?', whereArgs: [data]);
}
