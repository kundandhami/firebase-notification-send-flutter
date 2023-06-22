import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  DBHelper._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await Initdb();
    return _database!;
  }

  Future<Database> Initdb() async {
    var path = await getDatabasesPath();
    String paths = join(path, "demodatabase.db");
    return await openDatabase(paths, version: 1, onCreate: _creatdb);
  }

  Future _creatdb(Database db, int version) async {
    db.execute("""
    CREATE TABLE DEMOTABLBE(id INTEGER PRIMARY KEY AUTOINCREAMENT,name TEXT,age INTEGER,call BOOLEAN)""");
  }

  Future create(Map<String, dynamic> map) async {
    final db = await instance.database;
    final id = await db.insert("DEMOTABLE", map);
    print("create at id ++> $id");
  }

  Future<List> readone(int id) async {
    final db = await instance.database;
    List map = await db
        .query("DEMOTABLE", columns: col, where: "id=?", whereArgs: [id]);
    return map;
  }

  Future<List> readall() async {
    final db = await instance.database;
    List a = await db.query("DEMOTABLE");
    return a;
  }

  Future update(Map<String, dynamic> map, int id) async {
    final db = await instance.database;
    await db.update("DEMOTABLE", map, where: "id=?", whereArgs: [id]);
  }

  Future delete(int id) async {
    final db = await instance.database;
    await db.delete("DEMOTABLE", where: "id=?", whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

List<String> col = ["id", "name", "age", "call"];
