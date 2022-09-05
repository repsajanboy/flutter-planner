import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/category/post_category.dart';

class DatabaseHandler {
  Future<Database> initializeCategorieskDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'categories.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE categories(id TEXT PRIMARY KEY NOT NULL, name TEXT NOT NULL, theme INTEGER NOT NULL)",
        );
      },
      version: 1
    );
  }

  Future<void> postCategory(PostCategory postCategory) async {
    final Database db = await initializeCategorieskDB();
    await db.insert('categories', postCategory.toJson());
  }

  Future<dynamic> getCategories() async {
    final Database db = await initializeCategorieskDB();
    return await db.query('categories');
  }
}