class Task {
  Task({
    required this.id,
    required this.title,
    required this.taskDate,
    required this.startTime,
    required this.endTime,
    required this.category,
    required this.categoryId,
    required this.isComplete,
  });

  String id;
  String title;
  DateTime taskDate;
  DateTime startTime;
  DateTime endTime;
  String category;
  String categoryId;
  bool isComplete;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        taskDate: json["taskDate"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        category: json['category'],
        categoryId: json['categoryId'],
        isComplete: json["isComplete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "taskDate": taskDate.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
        "category": category,
        "categoryId": categoryId,
        "isComplete": isComplete
      };
}
