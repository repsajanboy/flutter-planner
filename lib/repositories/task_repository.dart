import '../data/tasks/post_task.dart';
import '../data/tasks/task.dart';
import '../networking/database_handler.dart';

class TaskRepository {
  final _databaseHandler = DatabaseHandler();
  //final _firebaseApi = FirebaseApi();
  TaskRepository();

  Future<void> postTask(PostTask postTask) async {
    await _databaseHandler.postTask(postTask);
  }

  Future<List<Task>> fetchTasks() async {
    final result = await _databaseHandler.getTasks() as List;
    return result.map((e) => Task.fromJson(e)).toList();
  }

  Future<void> completeTask(String id, int isComplete) async {
    await _databaseHandler.completeTask(id, isComplete);
  }

  Future<void> updateTask(PostTask task) async {
    await _databaseHandler.updateTask(task);
  }

  Future<void> deleteTask(String id) async {
    await _databaseHandler.deleteTask(id);
  }
}
