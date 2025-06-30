import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Dbhelper1 {
  Dbhelper1._();
  static final Dbhelper1 getinstance = Dbhelper1._();
  Database? mydb;

  Future<Database> getdb() async {
    mydb ??= await opendb();
    return mydb!;
  }

  Future<Database> opendb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "demo.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE data (sno INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT)");
      },
    );
  }

  Future<List<Map<String, dynamic>>> getallnotes() async {
    var db = await getdb();
    return await db.query("data");
  }

  Future<bool> adddata({required String mtitle, required String mdesc}) async {
    var db = await getdb();
    int rowaffected =
        await db.insert("data", {"title": mtitle, "description": mdesc});
    return rowaffected > 0;
  }

  Future<bool> updatedata(
      {required String mtitle, required String mdesc, required int sid}) async {
    var db = await getdb();
    int rowaffected = await db.update(
        "data",
        {
          "title": mtitle,
          "description": mdesc,
        },
        where: "sno = ?",
        whereArgs: [sid]);
    return rowaffected > 0;
  }

  Future<bool> deletedata(int sid) async {
    var db = await getdb();
    int rowaffected =
        await db.delete("data", where: "sno = ?", whereArgs: [sid]);
    return rowaffected > 0;
  }
}
