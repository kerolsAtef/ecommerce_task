import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'REAL NOT NULL';
    const intType = 'INTEGER NOT NULL';


    await db.execute('''
    CREATE TABLE products (
      id $idType,
      title $textType,
      price $doubleType,
      category $textType,
      description $textType,
      image $textType,
      ratingRate $doubleType,
      ratingCount $intType
    )
    ''');
  }

  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await instance.database;
    return await db.insert('products', product);
  }

  Future<List<Map<String, dynamic>>> fetchAllProducts() async {
    final db = await instance.database;
    return await db.query('products');
  }

  Future<Map<String, dynamic>?> fetchProduct(int id) async {
    final db = await instance.database;
    final result = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<int> clearProducts() async {
    final db = await instance.database;
    return await db.delete('products');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
