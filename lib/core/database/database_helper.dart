import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class DatabaseHelper {
  Database? _database;

  DatabaseHelper();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'vouchers_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE vouchers(
            id TEXT PRIMARY KEY,
            title TEXT,
            base_price TEXT,
            after_disc_price TEXT,
            discount_percentage TEXT,
            image_path TEXT
          )
        ''');
      },
    );
  }
}
