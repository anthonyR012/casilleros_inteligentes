import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static Database? dbInstance;
  static Future<void> openDb() async {
    dbInstance ??= await openDatabase(join(await getDatabasesPath(), "casillero.db"),
              onCreate: (db, version) async {
        await db.execute("""CREATE TABLE IF NOT EXISTS user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT UNIQUE,
        password TEXT,
        fingerprint TEXT
      )""");
      }, version: 1);
  }
}
