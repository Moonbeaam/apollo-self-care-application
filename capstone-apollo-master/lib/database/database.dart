import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:apolloApp/database/notes.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'journal.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY, noteId INTEGER, title TEXT, desc TEXT)",
        );
        await db.execute(
          "CREATE TABLE name(id INTEGER PRIMARY KEY, name TEXT)",
        );
        return db;
      },
      version: 1,
    );
  }

  Future<int> insertNote(Notes notes) async {
    int noteId = 0;
    Database _db = await database();
    await _db
        .insert('notes', notes.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      noteId = value;
    });
    return noteId;
  }

  Future<void> updateNoteTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE notes SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateNoteDesc(int id, String desc) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE notes SET desc = '$desc' WHERE id = '$id'");
  }

  Future<void> deleteNote(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM notes WHERE id = '$id'");
  }

  Future<List<Notes>> getNotes() async {
    Database _db = await database();
    List<Map<String, dynamic>> noteMap = await _db.query('notes');
    return List.generate(
      noteMap.length,
      (index) {
        return Notes(
          id: noteMap[index]['id'],
          title: noteMap[index]['title'],
          desc: noteMap[index]['desc'],
        );
      },
    );
  }
}
