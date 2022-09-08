import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/category/post_category.dart';
import '../data/tasks/post_task.dart';

class DatabaseHandler {
  //Categorie
  Future<Database> initializeCategorieskDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'categories.db'),
        onCreate: (database, version) async {
      await database.execute(
        "CREATE TABLE categories(id TEXT PRIMARY KEY NOT NULL, name TEXT NOT NULL, theme INTEGER NOT NULL)",
      );
    }, version: 1);
  }

  Future<void> postCategory(PostCategory postCategory) async {
    final Database db = await initializeCategorieskDB();
    await db.insert('categories', postCategory.toJson());
  }

  Future<dynamic> getCategories() async {
    final Database db = await initializeCategorieskDB();
    return await db.query('categories');
  }

  Future<void> updateCategory(PostCategory category) async {
    final Database db = await initializeCategorieskDB();
    await db.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<void> deleteCategory(String id) async {
    final Database db = await initializeCategorieskDB();
    await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Tasks
  Future<Database> initializeTasksDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'tasks.db'),
        onCreate: (database, version) async {
      await database.execute(
        "CREATE TABLE tasks(id TEXT PRIMARY KEY NOT NULL, title TEXT NOT NULL, taskDate TEXT NOT NULL, startTime TEXT NOT NULL, endTime TEXT NOT NULL, category TEXT NOT NULL, categoryId TEXT NOT NULL, isComplete INTEGER NOT NULL)",
      );
    }, version: 1);
  }

  Future<dynamic> getTasks() async {
    final Database db = await initializeTasksDB();
    return await db.query('tasks');
  }

  Future<void> postTask(PostTask postTask) async {
    final Database db = await initializeTasksDB();
    await db.insert('tasks', postTask.toJson());
  }

  Future<void> completeTask(String id, int isComplete) async {
    final Database db = await initializeTasksDB();
    await db.rawUpdate(
      'UPDATE tasks SET isComplete = ? WHERE id = ?',
      [isComplete, id],
    );
  }

  Future<void> updateTask(PostTask task) async {
    final Database db = await initializeTasksDB();
    await db.update(
      'tasks',
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(String id) async {
    final Database db = await initializeTasksDB();
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
