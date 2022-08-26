import 'package:firebase_database/firebase_database.dart';

import '../data/category/post_category.dart';
import '../data/tasks/post_task.dart';

class FirebaseApi {
  final tasksReference = FirebaseDatabase.instance.ref('tasks');
  final categoriesRef = FirebaseDatabase.instance.ref('categories');

  Future<dynamic> getTasks() async {
    final snapShot = await tasksReference.get();
    if(snapShot.exists) {
      return snapShot.value;
    }
    else {
      return {};
    }
  }

  Future<void> postTask(PostTask postTask) async {
    await tasksReference.push().set(postTask.toJson());
  }

  Future<void> completeTask(String id, bool isComplete) async {
    await tasksReference.update({
      "$id/isComplete": isComplete
    });
  }

  Future<void> updateTask(PostTask task) async {
    await tasksReference.child('${task.id}').update(task.toJson());
  }

  Future<void> deleteTask(String id) async {
    await tasksReference.child(id).remove();
  }

  Future<dynamic> getCategories() async {
    final snapShot = await categoriesRef.get();
    if(snapShot.exists) {
      return snapShot.value;
    }
  }

  Future<void> postCategory(PostCategory postCategory) async {
    await categoriesRef.push().set(postCategory.toJson());
  }
}