import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:track_to_trace/models/package.dart';

class SqliteProvider {
  static Database _database;
  SqliteProvider._();

  static final SqliteProvider db = SqliteProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Packages ("
          "id INTEGER PRIMARY KEY,"
          "packageName TEXT,"
          "snNumber TEXT"
          ")");
    });
  }

  newPackage(Package newPackage) async {
    final db = await database;
    var res = await db.insert("Packages", newPackage.toMap());
    return res;
  }

  getAllPackage() async {
    final db = await database;
    var res = await db.query("Packages");
    List<Package> list =
        res.isNotEmpty ? res.map((c) => Package.fromMap(c)).toList() : [];
    return list;
  }

  deletePackage(int packageId) async {
    final db = await database;
    var res = await db.delete("Packages", where: "id = ?", whereArgs: [packageId]);

    print(res);
  }

  cleanPackage() async {
    final db = await database;
    await db.delete("Packages");
  }
}
