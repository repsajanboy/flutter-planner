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
        id: json["id"] as String,
        title: json["title"] as String,
        taskDate: DateTime.parse(json["taskDate"] as String),
        startTime: DateTime.parse(json["startTime"] as String),
        endTime: DateTime.parse(json["endTime"] as String),
        category: json['category'] as String,
        categoryId: json['categoryId'] as String,
        isComplete: json["isComplete"] == 0 ? false : true,
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
