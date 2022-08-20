import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  final tasksReference = FirebaseDatabase.instance.ref().child('tasks');

  Future<dynamic> getTasks() async {
    final snapShot = await tasksReference.get();
    if(snapShot.exists) {
      return snapShot.value;
    }
  }
}