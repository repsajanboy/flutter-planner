import '../data/category/category.dart';
import '../data/category/post_category.dart';
import '../networking/firebase_api.dart';

class CategoryRepository{
  final _firebaseApi = FirebaseApi();

  CategoryRepository();

  Future<void> postCategory(PostCategory postCategory) async {
    await _firebaseApi.postCategory(postCategory);
  }

  Future<List<Category>> fetchCategories() async {
    final result = await _firebaseApi.getCategories();
    final List<Category> fetchCategories = [];
    result.forEach((key, value) {
      fetchCategories.add(Category(
        id: key,
        name: value['name'] as String,
        theme: value['theme'] as int,
      ));
    });
    return fetchCategories;
  }

  Future<void> updateCategory(PostCategory category) async {
    await _firebaseApi.updateCategory(category);
  }
}