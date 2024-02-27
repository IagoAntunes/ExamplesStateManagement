import 'package:sqflite/sqflite.dart';
import 'package:testando_coisas/core/models/todo_model.dart';
import 'package:testando_coisas/core/states/base_state.dart';

class SqlfliteDatabase {
  static Future<Database> db() async {
    Database database = await openDatabase('sqflite_db', version: 1,
        onCreate: (Database db, int version) async {
      await createTables(db);
    });
    return database;
  }

  static createTables(Database db) {
    createTodoTable(db);
  }

  static Future<void> createTodoTable(Database database) async {
    await Future.wait([
      database.execute("""CREATE TABLE todos_sqflite(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        isChecked INTEGER
        )
      """),
    ]);
  }

  static Future<IState> updateTodo(TodoEntity todo) async {
    final db = await SqlfliteDatabase.db();

    final result = await db.update('todos_sqflite', todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
    if (result >= 1) {
      return SuccessState();
    } else {
      return FailureState();
    }
  }

  static Future<IState> removeTodo(TodoEntity todo) async {
    final db = await SqlfliteDatabase.db();

    final result =
        await db.delete('todos_sqflite', where: 'id = ?', whereArgs: [todo.id]);
    if (result >= 1) {
      return SuccessState();
    } else {
      return FailureState();
    }
  }

  static Future<IState> createTodo(TodoEntity todo) async {
    final db = await SqlfliteDatabase.db();
    final id = await db.insert('todos_sqflite', todo.toMap());
    if (id >= 1) {
      return SuccessState();
    } else {
      return FailureState();
    }
  }

  static Future<List<TodoEntity>> getTodos() async {
    final db = await SqlfliteDatabase.db();
    final list = await db.query('todos_sqflite');
    var result = list.map((e) => TodoEntity.fromMap(e)).toList();
    return result;
  }
}
