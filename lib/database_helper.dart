import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'voupedir.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        login TEXT,
        senha TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE tipo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE restaurante (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        latitude REAL,
        longitude REAL,
        usuario_id INTEGER,
        tipo_id INTEGER,
        FOREIGN KEY (usuario_id) REFERENCES usuario(id),
        FOREIGN KEY (tipo_id) REFERENCES tipo(id)
      )
    ''');
  }
}
