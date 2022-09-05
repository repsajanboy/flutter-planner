import '../data/category/category.dart';
import '../data/category/post_category.dart';
import '../networking/database_handler.dart';
import '../networking/firebase_api.dart';

class CategoryRepository {
  final _firebaseApi = FirebaseApi();
  final _databaseHandler = DatabaseHandler();

  CategoryRepository();

  Future<void> postCategory(PostCategory postCategory) async {
    await _databaseHandler.postCategory(postCategory);
  }

  Future<List<Category>> fetchCategories() async {
    final result = await _databaseHandler.getCategories() as List;

    return result.map((e) => Category.fromJson(e)).toList();
    // final List<Category> fetchCategories = [];
    // if (result.length != 0) {
      
    //}

    //return fetchCategories;
  }

  Future<void> updateCategory(PostCategory category) async {
    await _firebaseApi.updateCategory(category);
  }

  Future<void> deleteCategory(String id) async {
    await _firebaseApi.deleteCategory(id);
  }
}
