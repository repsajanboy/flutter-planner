import '../networking/api_client.dart';
import '../data/tasks/post_task.dart';
import '../data/tasks/task.dart';
import '../networking/firebase_api.dart';

class TaskRepository {
  final ApiClient apiClient;
  final _firebaseApi = FirebaseApi();
  TaskRepository({required this.apiClient});

  Future<void> postTask(PostTask postTask) async {
    await _firebaseApi.postTask(postTask);
  }

  Future<List<Task>> fetchTasks() async {
    final result = await _firebaseApi.getTasks();
    // final result = await apiClient.fetchTasks();
    //final extractedData = result as Map<String, dynamic>;
    final List<Task> fetchTasks = [];
    if (result != null) {
      result.forEach((key, value) {
        fetchTasks.add(Task(
            id: key,
            title: value['title'] as String,
            taskDate: DateTime.parse(value['taskDate'] as String),
            startTime: DateTime.parse(value['startTime'] as String),
            endTime: DateTime.parse(value['endTime'] as String),
            category: value['category'] as String,
            isComplete: value['isComplete'] as bool));
      });
    }

    return fetchTasks;
  }

  Future<void> completeTask(String id, bool isComplete) async {
    await apiClient.completeTask(id, isComplete);
  }
}
