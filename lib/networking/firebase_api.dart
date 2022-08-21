import 'package:firebase_database/firebase_database.dart';

import '../data/category/post_category.dart';
import '../data/tasks/post_task.dart';

class FirebaseApi {
  final tasksReference = FirebaseDatabase.instance.ref().child('tasks');
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
    await tasksReference.set(postTask.toJson());
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