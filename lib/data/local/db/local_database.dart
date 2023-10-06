import 'package:flutter_defualt_project/data/models/to_do_model/to_do_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("defaultDatabase.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
     CREATE TABLE ${ToDoModelField.tableName}(
    ${ToDoModelField.id} $idType,
    ${ToDoModelField.name} $textType,
    ${ToDoModelField.description} $textType,
    ${ToDoModelField.location} $textType,
    ${ToDoModelField.time} $textType,
    ${ToDoModelField.yearMonth} $textType,
    ${ToDoModelField.day} $textType,
    ${ToDoModelField.priority} $intType
    )
    ''');
  }

  static Future<ToDoModel> insertToDo(ToDoModel toDoModel) async {
    final db = await getInstance.database;
    final int id =
        await db.insert(ToDoModelField.tableName, toDoModel.toJson());
    return toDoModel.copyWith(id: id);
  }

  static Future<List<ToDoModel>> getAllToDos() async {
    List<ToDoModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(ToDoModelField.tableName))
        .map((e) => ToDoModel.fromJson(e))
        .toList();

    return allToDos;
  }

  static Future<List<ToDoModel>> getToDoByDate(String yearMonth) async {
    print("HEYYYYY");
    List<ToDoModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(
      ToDoModelField.tableName,
      where: "${ToDoModelField.yearMonth} LIKE ?",
      whereArgs: [yearMonth],
    ))
        .map((e) => ToDoModel.fromJson(e))
        .toList();
    return allToDos;
  }

  static updateToDo({required ToDoModel toDoModel,required int id}) async {
    final db = await getInstance.database;
    db.update(
      ToDoModelField.tableName,
      toDoModel.toJson(),
      where: "${ToDoModelField.id} = ?",
      whereArgs: [id],
    );
  }

  static deleteToDo(int id) async {
    final db = await getInstance.database;
    db.delete(
      ToDoModelField.tableName,
      where: "${ToDoModelField.id} = ?",
      whereArgs: [id],
    );
  }
}
