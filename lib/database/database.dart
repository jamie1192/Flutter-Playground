import 'dart:io';
import 'dart:async';

import 'package:flutter_playground/models/word.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static const String TABLE_NAME = 'wordTable';

  Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, "appDatabase.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE $TABLE_NAME ("
              "id INTEGER PRIMARY KEY,"
              "word TEXT"
              ")"
          );
        });
  }


  newWord(Word newWord) async {
    final db = await database;
    //generate unique primary key
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM $TABLE_NAME");
    int id = table.first["id"];
    //insert with new id
    var raw = await db.rawInsert(
      "INSERT INTO $TABLE_NAME (id, word)"
          " VALUES (?,?,)",
      [id, newWord.word]);

    return raw;
  }

  updateWord(Word newWord) async {
    final db = await database;
    var res = await db.update("$TABLE_NAME", newWord.toJson(),
      where: "id = ?", whereArgs: [newWord.id]);
    return res;
  }

}