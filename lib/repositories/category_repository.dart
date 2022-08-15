import '../data/category/post_category.dart';
import '../networking/api_client.dart';

class CategoryRepository{
  final ApiClient apiClient;

  CategoryRepository({required this.apiClient});

  Future<void> postCategory(PostCategory postCategory) async {
    await apiClient.postCategory(postCategory);
  }
}