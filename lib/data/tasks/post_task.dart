class PostTask {
  PostTask({
    this.id,
    this.title,
    this.taskDate,
    this.startTime,
    this.endTime,
    this.category,
    this.categoryId,
    this.isComplete,
  });

  String? id;
  String? title;
  DateTime? taskDate;
  DateTime? startTime;
  DateTime? endTime;
  String? category;
  String? categoryId;
  bool? isComplete;

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "taskDate": taskDate!.toIso8601String(),
        "startTime": startTime!.toIso8601String(),
        "endTime": endTime!.toIso8601String(),
        "category": category,
        "categoryId": categoryId,
        "isComplete": isComplete! ? 1: 0
      };
}
