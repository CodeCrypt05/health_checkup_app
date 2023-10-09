import 'package:flutter/material.dart';
import 'package:health_checkup_app/data/models/popular_tests.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documnetDirectory = await getApplicationDocumentsDirectory();
    String path = join(documnetDirectory.path, 'popular_tests.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE popular_tests (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, discountPrice INTEGER, price INTEGER)');
  }

  // Insert Data by calling this function
  Future<PopularLabTests> insert(PopularLabTests popularLabTests) async {
    print(popularLabTests.toMap());
    var dbClient = await db;
    await dbClient!.insert('popular_tests', popularLabTests.toMap());
    return popularLabTests;
  }

  // get data from database of popular lab tests
  Future<List<PopularLabTests>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('popular_tests');
    return queryResult.map((e) => PopularLabTests.fromMap(e)).toList();
  }

  // total price
  Future<int> sumAllPrices() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
      'SELECT SUM(price) AS total_price FROM popular_tests',
    );
    int totalPrice = result[0]['total_price'] as int? ?? 0;
    print(totalPrice);
    return totalPrice;
  }

  Future<int> calculateTotalSavings() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
      'SELECT SUM(price - discountPrice) AS total_savings FROM popular_tests',
    );
    int totalSavings = Sqflite.firstIntValue(result) ?? 0;
    return totalSavings;
  }

  Future<int> amountToPaid() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
      'SELECT SUM(discountPrice) AS total_savings FROM popular_tests',
    );
    int totalSavings = Sqflite.firstIntValue(result) ?? 0;
    return totalSavings;
  }

  // To check if a specific UNIQUE key value already exists in a SQLite database
  Future<bool> isTestIdExists(String title) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result;
    if (dbClient != null) {
      result = await dbClient.query(
        'popular_tests',
        where: 'title = ?',
        whereArgs: [title],
      );
      return result.isNotEmpty;
    }
    return false;
  }

  // Delete data from database
  Future<int> delete(String title) async {
    var dbClient = await db;
    return await dbClient!
        .delete('popular_tests', where: 'title = ?', whereArgs: [title]);
  }
}
