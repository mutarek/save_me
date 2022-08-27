import 'package:sqflite/sqflite.dart';

import '../models/note_model.dart';

class NotesDatabase {
  static final _name = "NotesDatabase.db";
  static final _version = 1;

  late Database database;
  static final tableName = 'notes';

  initDatabase() async {
    database = await openDatabase(
        _name,
        version: _version,
        onCreate: (Database db, int version) async {
          await db.execute(
              '''CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    bus_name TEXT,
                    customer_name TEXT,
                    seat TEXT,
                    number TEXT,
                    journey_date DATETIME,
                    booking_time DATETIME
                    )'''
          );
        }
    );
  }

  Future<int> insertNote(Note note) async {
    return await database.insert(tableName,
        note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<int> updateNote(Note note) async {
    return await database.update(tableName, note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    return await database.query(tableName);
  }

  Future<Map<String, Object?>?> getNotes(int id) async {
    var result = await database.query(tableName,
        where: 'id = ?',
        whereArgs: [id]
    );

    if (result.length > 0) {
      return result.first;
    }

    return null;
  }

  Future<int> deleteNote(int id) async {
    return await database.delete(tableName,
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  closeDatabase() async {
    await database.close();
  }
}