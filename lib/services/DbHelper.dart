import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/StandingModel.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'football.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE standings(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        position INTEGER,
        teamName TEXT,
        playedGames INTEGER,
        points INTEGER,
        won INTEGER,
        draw INTEGER,
        lost INTEGER,
        goalDifference INTEGER
      )
    ''');
  }

  Future<void> insertStandings(List<StandingModel> standings) async {
    final db = await database;
    final batch = db.batch();

    for (var standing in standings) {
      batch.insert(
        'standings',
        standing.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  Future<List<StandingModel>> getStandings() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('standings');

    return List.generate(maps.length, (index) {
      return StandingModel.fromMap(maps[index]);
    });
  }
}
