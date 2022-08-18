import '../networking/api_client.dart';
import '../data/tasks/post_task.dart';
import '../data/tasks/task.dart';

class TaskRepository {
  final ApiClient apiClient;

  TaskRepository({required this.apiClient});

  Future<void> postTask(PostTask postTask) async {
    await apiClient.postTask(postTask);
  }

  Future<List<Task>> fetchTasks() async {
    final result = await apiClient.fetchTasks();
    final extractedData = result as Map<String, dynamic>;
    final List<Task> fetchTasks = [];
    extractedData.forEach((key, value) {
      fetchTasks.add(Task(
        id: key,
        title: value['title'] as String,
        taskDate: DateTime.parse(value['taskDate'] as String) ,
        startTime: DateTime.parse(value['startTime'] as String),
        endTime: DateTime.parse(value['endTime'] as String),
        category: value['category'] as String,
        isComplete: value['isComplete'] as bool
      ));
     });
     return fetchTasks;
  }

  Future<void> completeTask(String id, bool isComplete) async {
    await apiClient.completeTask(id, isComplete);
  }
}