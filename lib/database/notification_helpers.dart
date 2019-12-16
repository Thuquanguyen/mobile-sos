import 'dart:io';

import 'package:hello_wolrd/model/notification_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class NotificationHelper {
  static final _databaseName = "Notification.db";
  static final _databaseVersion = 1;
  static final tableName = "NotificationItem";

  static final columnId = "id";
  static final columnTitle = "title";
  static final columnContent = "content";
  static final columnDateTime = "dateTime";
  static final columnStatus = "status";

  //Tạo một callas singletion
  NotificationHelper._();

  static final NotificationHelper instance = NotificationHelper._();

  //Open connect to database

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  //open database

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  //create Database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
    $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnTitle TEXT NOT NULL,
    $columnContent TEXT NOT NULL,
    $columnDateTime TEXT NOT NULL,
    $columnStatus INTEGER NOT NULL
    )
    ''');
  }

  // add data to database
  Future<int> insert(NotificationItem notificationItem) async {
    Database db = await database;
    int id = await db.insert(tableName, notificationItem.toMap());
    return id;
  }

  //Get all Notificaiton Data
  Future<List<NotificationItem>> queryAllNotificaiton() async {
    Database db = await database;
    var res = await db.query("NotificationItem");
    List<NotificationItem> list = res.isNotEmpty
        ? res.map((c) => NotificationItem.fromMap(c)).toList()
        : [];
    return list;
  }

  //Get database from id
  Future<NotificationItem> queryNotificaiton(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableName,
        columns: [
          columnId,
          columnTitle,
          columnContent,
          columnDateTime,
          columnStatus
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return NotificationItem.fromMap(maps.first);
    }
    return null;
  }

  //Update notification
  updateNotification(NotificationItem notificationItem) async {
    final db = await database;
    var res = await db.update("NotificationItem", notificationItem.toMap(),
        where: "id = ?", whereArgs: [notificationItem.id]);
    return res;
  }

  //Delete notification
  deleteNotificaiton(int id) async {
    Database db = await database;
    db.delete("NotificationItem", where: "id = ?", whereArgs: [id]);
  }
  getAllClients() async {
    final db = await database;
    var res = await db.query("NotificationItem");
    List<NotificationItem> list =
    res.isNotEmpty ? res.map((c) => NotificationItem.fromMap(c)).toList() : [];
    return list.length;
  }

}
