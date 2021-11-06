import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

///Bu Helper Sqlite için oluşturuldu. Eğer mobil cihaza sqlite kullanılacaksa bu helper iş görür.
///Sqflite ve path_provider kütüphanelerinin son sürümü çekilip kullanılmalıdır.

class Message {
  static final Message _message = Message._internal();

  ///Tablo ve columnlar tanımlanır

  String tblProduct = "product";
  String colId = "id";
  String colBarcode = "barcode";
  String colTotal = "total";
  String colUpdateDate = "updateDate";

  Message._internal();

  factory Message() {
    return _message;
  }

  ///Database tanıtılır.
  static Database _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    ///Database'in gömüleceği kök klasör çekilir.
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "products.db";
    var dbProducts = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbProducts;
  }

  void _createDb(Database db, int newVersion) async {
    ///Tablo oluşturulur.
    await db.execute(
        "CREATE TABLE $tblProduct($colId INTEGER PRIMARY KEY, $colBarcode TEXT, $colTotal INTEGER, $colUpdateDate TEXT)");
  }

  Future<int> insert(Product product) async {
    Database db = await this.db;
    var result = await db.insert(tblProduct, product.toMap());
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $tblProduct"));

    return result;
  }

  Future<List> getProducts() async {
    List<Product> todoList = <Product>[];
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $Product");
    result.forEach((element) {
      todoList.add(Product.fromObject(element));
    });
    return todoList;
  }

  Future<int> update(Product product) async {
    Database db = await this.db;
    var result = await db.update(tblProduct, product.toMap(),
        where: "$colId = ?", whereArgs: [product.id]);
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result =
        await db.delete(tblProduct, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
