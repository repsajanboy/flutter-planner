import 'dart:convert';

import '../networking/api_client.dart';
import '../data/tasks/post_task.dart';
import '../data/tasks/task.dart';

class TaskRepository {
  final ApiClient apiClient;

  TaskRepository({required this.apiClient});

  Future<Task> postTask(PostTask postTask) async {
    final result = await apiClient.postTask(postTask);
    return Task.fromJson(result as Map<String, dynamic>);
  }

  Future<List<Task>> fetchTasks() async {
    final result = await apiClient.fetchTasks();
    Map<String, dynamic> extractedData = json.decode(result);
    final List<Task> fetchTasks = [];
    extractedData.forEach((key, value) {
      fetchTasks.add(Task(
        id: key,
        title: value['title'],
        taskDate: value['taskDate'],
        startTime: value['startTime'],
        endTime: value['endTime'],
        isComplete: value['isComplete']
      ));
     });
     return fetchTasks;
  }
}