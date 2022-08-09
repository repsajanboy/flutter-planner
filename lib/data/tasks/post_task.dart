import 'package:flutter/material.dart';

class PostTask {
  PostTask({
    this.id,
    this.title,
    this.taskDate,
    this.startTime,
    this.endTime,
    this.isComplete,
  });

  String? id;
  String? title;
  DateTime? taskDate;
  DateTime? startTime;
  DateTime? endTime;
  bool? isComplete;

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "taskDate": taskDate!.toIso8601String(),
        "startTime": startTime!.toIso8601String(),
        "endTime": endTime!.toIso8601String(),
        "isComplete": isComplete
      };
}
