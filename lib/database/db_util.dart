import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';
class DbUtil{

  static Future<sql.Database> database() async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE places (id TEXT PRIMARY KEY, name TEXT, description TEXT, image TEXT)'
        );
      },
      version: 1,
    );
  }


  static Future<void> insert(String table, Map<String, dynamic> data) async{
    final db = await DbUtil.database();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);

  }

  static Future<List<Map<String, dynamic>>> getData(String table) async{
    final db = await DbUtil.database();
    return db.query(table);

  }
}