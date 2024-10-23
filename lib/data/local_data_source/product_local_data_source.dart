import 'package:e_commerce_task/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductLocalDataSource {
  Database? _database;

  // Method to initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY, title TEXT, price TEXT, category TEXT, description TEXT, image TEXT,ratingRate REAL,ratingCount INTEGER )',
        );
      },
    );
  }

  Future<void> cacheProducts(List<Product> products) async {
    final db = await database;

    // Clear existing data
    await db.delete('products');

    // Insert new products
    for (var product in products) {
      await db.insert(
        'products',
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Product>> getCachedProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product.fromJson(maps[i]);
    });
  }
}
