import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/models/user_model.dart';

class DatabaseService {
  String tableName = 'userTable';
  String columnName = 'userName';
  String columnPassword = 'userPassword';

  static final DatabaseService _instence = new DatabaseService.internal();

  DatabaseService.internal();

  factory DatabaseService() => _instence;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Mydata.db");
    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('تم فتح قاعدة البيانات');
    return ourDB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($columnName TEXT PRIMARY KEY, $columnPassword TEXT)");
    print('تم انشاء قاعدة البيانات');
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int result = await dbClient!.insert(tableName, user.toMap());
    print('تم حفظ المستخدم');
    return result;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await db;
    var result = await dbClient!.rawQuery("SELECT * FROM $tableName");
    print('تم جلب كافة المستخدمين');
    print(result);
    return result.toList() as List<User>;
  }

  Future<User?> getUser(String userId) async {
    var dbClient = await db;
    var result = await dbClient!.rawQuery("SELECT * FROM $tableName WHERE "
        "$columnName = '$userId'"
        // "$columnPassword = '$pass'"
        );
    if (result.length == 0)
      return null;
    else {
      print('تم جلب المستحدم المطلوب');
      return new User.fromMap(result.first);
    }
  }

  Future<int> deleteUser(String userId) async {
    var dbClient = await db;
    var result = await dbClient!
        .delete(tableName, where: "$columnName = ?", whereArgs: [userId]);
    print('تم حذف المستخدم');
    return result;
  }

  Future<int> updateUsse(User user) async {
    var dbClient = await db;
    print('تم التعديل');
    return await dbClient!.update(tableName, user.toMap(),
        where: "$columnName = ?", whereArgs: [user.username]);
  }

  Future close() async {
    var dbClient = await db;
    print('تم اغلاق قاعدة البيانات');
    return dbClient!.close();
  }
}
