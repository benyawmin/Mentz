// import 'dart:async';
// import 'dart:io';
// import 'package:mentz/src/models/journey_model.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseProvider {
//   static final DatabaseProvider instance = DatabaseProvider._instance();
//   static Database? _db;

//   DatabaseProvider._instance();

//   static const String tableLocations = 'locations';
//   static const String columnId = 'id';
//   static const String columnIsGlobalId = 'isGlobalId';
//   static const String columnName = 'name';
//   static const String columnDisassembledName = 'disassembledName';
//   static const String columnCoord = 'coord';
//   static const String columnType = 'type';
//   static const String columnMatchQuality = 'matchQuality';
//   static const String columnIsBest = 'isBest';
//   static const String columnProductClasses = 'productClasses';
//   static const String columnParent = 'parent';
//   static const String columnProperties = 'properties';

//   Future<Database> get db async {
//     _db ??= await _initDb();
//     return _db!;
//   }

//   Future<Database> _initDb() async {
//     final Directory dir = await getApplicationDocumentsDirectory();
//     final String path = join(dir.path, 'journey.db');
//     final Database db =
//         await openDatabase(path, version: 1, onCreate: _createDb);
//     return db;
//   }

//   Future<void> _createDb(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $tableLocations (
//         $columnId TEXT PRIMARY KEY,
//         $columnIsGlobalId BOOL,
//         $columnName TEXT,
//         $columnDisassembledName TEXT,
//         $columnCoord BLOB,
//         $columnType TEXT,
//         $columnMatchQuality INTEGER,
//         $columnIsBest BOOL,
//         $columnProductClasses BLOB,
//         $columnParent TEXT,
//         $columnProperties TEXT
//       )
//     ''');
//   }

//   Future<int> insertLocation(Location location) async {
//     final Database dbClient = await db;
//     return await dbClient.insert(tableLocations, location.toJson());
//   }

//   Future<List<Location>> fetchAllLocations() async {
//     final Database dbClient = await db;
//     final List<Map<String, dynamic>> maps =
//         await dbClient.query(tableLocations);
//     return List.generate(maps.length, (i) => Location.fromJson(maps[i]));
//   }

//   Future<int> updateLocation(Location location) async {
//     final Database dbClient = await db;
//     return await dbClient.update(
//       tableLocations,
//       location.toJson(),
//       where: '$columnId = ?',
//       whereArgs: [location.id],
//     );
//   }

//   Future<int> deleteLocation(String id) async {
//     final Database dbClient = await db;
//     return await dbClient.delete(
//       tableLocations,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }
// }