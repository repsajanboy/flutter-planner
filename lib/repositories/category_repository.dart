import '../data/category/category.dart';
import '../data/category/post_category.dart';
import '../networking/api_client.dart';

class CategoryRepository{
  final ApiClient apiClient;

  CategoryRepository({required this.apiClient});

  Future<void> postCategory(PostCategory postCategory) async {
    await apiClient.postCategory(postCategory);
  }

  Future<List<Category>> fetchCategories() async {
    final result = await apiClient.fetchCategories();
    final extractedData = result as Map<String, dynamic>;
    final List<Category> fetchCategories = [];
    extractedData.forEach((key, value) {
      fetchCategories.add(Category(
        id: key,
        name: value['name'] as String,
        theme: value['theme'] as int,
      ));
    });
    return fetchCategories;
  }
}