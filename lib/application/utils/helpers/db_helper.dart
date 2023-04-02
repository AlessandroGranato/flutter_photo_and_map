import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static String PLACE_TABLE_NAME = 'places';
  static int PLACE_DB_VERSION = 1;

  static Future<sql.Database> getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, '${PLACE_TABLE_NAME}.db'),
      version: PLACE_DB_VERSION,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $PLACE_TABLE_NAME (id TEXT PRIMARY KEY, name TEXT, photo_path TEXT, location_lat REAL, location_lng REAL, location_address TEXT)');
      },
    );
  }

  static Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    return await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final db = await getDatabase();
    return db.query(table);
  }
}
