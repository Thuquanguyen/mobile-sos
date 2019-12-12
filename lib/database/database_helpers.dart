import 'dart:io';
import 'package:hello_wolrd/model/station_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "Station.db";
  static final _databaseVersion = 1;
  static final tableName = "StationItem";

  static final columnId = "id";
  static final columnName = "name";
  static final columnAbout = "about";
  static final columnAddress = "address";
  static final columnConfirm = "confirmAddress";
  static final columnFavorite= "favorite";
  static final columnEmail = "email";
  static final columnLat = "lat";
  static final columnLong = "long";
  static final columnOpenTime = "openAndCloseTime";
  static final columnRate = "rate";
  static final columnWebsite = "website";
  static final columnImage = "imageList";
  static final columnPhone = "phoneNumber";
  static final columnSupport = "supportDetails";
  static final columnDay = "workingDay";

  //Tạo một class singletion
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //Mở kết nối tới database

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  //Mở database
  _initDatabase() async {
    //Lấy đường dẫn file data base trong Android và IOS sử dụng thư viện path_provider
    Directory documnetDirectory = await getApplicationDocumentsDirectory();
    String path = join(documnetDirectory.path, _databaseName);
    //Mở database
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  //Câu lệnh tạo database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
       $columnId INTEGER PRIMARY KEY,
       $columnName TEXT NOT NULL,
       $columnAbout TEXT NOT NULL,
       $columnAddress TEXT NOT NULL,
       $columnConfirm INTEGER NOT NULL,
       $columnFavorite INTEGER NOT NULL,
       $columnEmail TEXT NOT NULL,
       $columnLat DOUBLE NOT NULL,
       $columnLong DOUBLE NOT NULL,
       $columnOpenTime TEXT NOT NULL,
       $columnRate DOUBLE NOT NULL, 
       $columnWebsite TEXT NOT NULL,
       $columnImage TEXT NULL,
       $columnPhone TEXT NULL,
       $columnSupport TEXT NULL,
       $columnDay TEXT NULL
       )
    ''');
  }

  //Phương thức thêm vào database

  Future<int> insert(StationItem station) async {
    Database db = await database;
    int id = await db.insert(tableName, station.toMap());
    return id;
  }
  Future<List<StationItem>> queryAllStation() async {
    Database db = await database;
    var res = await db.query("StationItem");
    List<StationItem> list =
    res.isNotEmpty ? res.map((c) => StationItem.fromMap(c)).toList() : [];
    return list;
  }
//Lấy dữ liệu từ database
  Future<StationItem> queryStation(int id) async {
    Database db = await database;
    // ignore: unnecessary_statements
    List<Map> maps = await db.query(tableName, columns: [
      columnId,
      columnName,
      columnAddress,
      columnConfirm,
      columnFavorite,
      columnEmail,
      columnLat,
      columnLong,
      columnOpenTime,
      columnRate,
      columnWebsite,
      columnImage,
      columnPhone,
      columnSupport,
      columnDay
    ],where: '$columnId = ?',
    whereArgs: [id]);
    if (maps.length > 0) {
      return StationItem.fromMap(maps.first);
    }
    return null;
  }

  deleteStation(int id) async
  {
    Database db = await database;
    db.delete("StationItem",where: "id = ?",whereArgs: [id]);
  }
}
