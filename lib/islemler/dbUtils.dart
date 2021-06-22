import 'package:unisis/siniflar/dbModel.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbUtils {
  static final DbUtils _dbUtils = DbUtils._internal();
  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "unisis.db";
    var dbUnisiss = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbUnisiss;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE kayitlar(id INTEGER PRIMARY KEY, ekran TEXT, renk int)");
  }

  Future<void> deleteTable() async {
    final Database db = await this.db;
    db.delete('kayitlar');
  }

  Future<void> insertKayit(dbModel kayit) async {
    final Database db = await this.db;
    await db.insert(
      'kayitlar',
      kayit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<dbModel>> kayitlar() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('kayitlar');
    return
      List.generate (maps.length, (i) {
      return dbModel(id: maps[i]['id'],
        ekran: maps[i]['ekran'],
        renk: maps[i]['renk'],
      );
    });
  }

  Future<void> updateKayit(dbModel kayit) async {
    final db = await this.db;
    await db.update(
      'kayitlar',
      kayit.toMap(),
      where: "id = ?",
      whereArgs: [kayit.id],
    );
  }

  Future<void> deleteKayit(int id) async {
    final db = await this.db;
    await db.delete(
      'kayitlar',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}