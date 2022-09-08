import '../data/category/category.dart';
import '../data/category/post_category.dart';
import '../networking/database_handler.dart';

class CategoryRepository {
  //final _firebaseApi = FirebaseApi();
  final _databaseHandler = DatabaseHandler();

  CategoryRepository();

  Future<void> postCategory(PostCategory postCategory) async {
    await _databaseHandler.postCategory(postCategory);
  }

  Future<List<Category>> fetchCategories() async {
    final result = await _databaseHandler.getCategories() as List;

    return result.map((e) => Category.fromJson(e)).toList();
  }

  Future<void> updateCategory(PostCategory category) async {
    await _databaseHandler.updateCategory(category);
  }

  Future<void> deleteCategory(String id) async {
    await _databaseHandler.deleteCategory(id);
  }
}
