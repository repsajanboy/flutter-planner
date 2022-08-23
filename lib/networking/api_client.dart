import 'dart:convert';

import 'package:dio/dio.dart';
import '../data/category/post_category.dart';
import '../data/tasks/post_task.dart';

//this site is not working
const baseUrl =
    "https://example.site.com";

class ApiClient {
  final _dio = Dio();

  //Post Task
  Future<dynamic> postTask(PostTask postTask) async {
    try {
      const postTaskUrl = "$baseUrl/tasks.json";
      final postTaskResponse = await _dio.post(
        postTaskUrl,
        data: postTask.toJson(),
      );

      final toEncode = json.encode(postTaskResponse.data);
      return json.decode(toEncode);
    } on DioError catch (e) {
      final err = json.decode(e.response.toString());
      throw Exception(err);
    }
  }

  //Fetch all tasks
  Future<dynamic> fetchTasks() async {
    try {
      const tasksUrl = "$baseUrl/tasks.json";
      final tasksResponse = await _dio.get(tasksUrl);
      final toEncode = json.encode(tasksResponse.data);
      return json.decode(toEncode);
    } on DioError catch (e) {
      final err = json.decode(e.response.toString());
      throw Exception(err);
    }
  }

  //Update task to complete
  Future<dynamic> completeTask(String id, bool isComplete) async {
    try {
      final taskUrl = "$baseUrl/tasks/$id.json";
      final taskResponse = await _dio.patch(
        taskUrl,
        data: json.encode({
          'isComplete': isComplete,
        }),
      );
      final toEncode = json.encode(taskResponse.data);
      return json.decode(toEncode);
    } on DioError catch (e) {
      final err = json.decode(e.response.toString());
      throw Exception(err);
    }
  }

  //Post Category
  Future<dynamic> postCategory(PostCategory postCategory) async {
    try {
      const postCategoryUrl = "$baseUrl/categories.json";
      final postCategoryResponse = await _dio.post(
        postCategoryUrl,
        data: postCategory.toJson(),
      );

      final toEncode = json.encode(postCategoryResponse.data);
      return json.decode(toEncode);
    } on DioError catch (e) {
      final err = json.decode(e.response.toString());
      throw Exception(err);
    }
  }

  Future<dynamic> fetchCategories() async {
    try {
      const categoriesUrl = "$baseUrl/categories.json";
      final categoriesResponse = await _dio.get(categoriesUrl);
      final toEncode = json.encode(categoriesResponse.data);
      return json.decode(toEncode);
    } on DioError catch (e) {
      final err = json.decode(e.response.toString());
      throw Exception(err);
    }
  }
}
