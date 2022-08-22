part of 'create_task_bloc.dart';

enum CreateTaskStatus { initial, success, error }

class CreateTaskState extends Equatable {
  final String id;
  final String title;
  final DateTime taskDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String category;
  final bool isComplete;
  final CreateTaskStatus status;
  final bool isCategoryLoaded;
  final int categoryTheme;
  CreateTaskState({
    this.id = '',
    this.title = '',
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    this.category = '',
    this.isComplete = false,
    this.status = CreateTaskStatus.initial,
    this.isCategoryLoaded = false,
    this.categoryTheme = 0,
  })  : taskDate = taskDate ?? DateTime.now(),
        startTime = startTime ?? TimeOfDay.now(),
        endTime = endTime ?? TimeOfDay.now();

  CreateTaskState copyWith({
    String? id,
    String? title,
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? category,
    bool? isComplete,
    CreateTaskStatus? status,
    bool? isCategoryLoaded,
    int? categoryTheme,
  }) {
    return CreateTaskState(
      id: id ?? this.id,
      title: title ?? this.title,
      taskDate: taskDate ?? this.taskDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      category: category ?? this.category,
      isComplete: isComplete ?? this.isComplete,
      status: status ?? this.status,
      isCategoryLoaded: isCategoryLoaded ?? this.isCategoryLoaded,
      categoryTheme: categoryTheme ?? this.categoryTheme,
    );
  }

  @override
  List<Object> get props =>
      [id, title, taskDate, startTime, endTime, category, isComplete, status, isCategoryLoaded];
}
