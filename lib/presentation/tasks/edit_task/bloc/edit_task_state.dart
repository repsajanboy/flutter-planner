part of 'edit_task_bloc.dart';

enum EditTaskStatus { initial, success, error }

class EditTaskState extends Equatable {
  final String id;
  final String title;
  final DateTime taskDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String category;
  final String categoryId;
  final bool isComplete;
  final EditTaskStatus status;
  final int categoryTheme;
  EditTaskState({
    this.id = '',
    this.title = '',
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    this.category = '',
    this.categoryId = '',
    this.isComplete = false,
    this.status = EditTaskStatus.initial,
    this.categoryTheme = 0,
  })  : taskDate = taskDate ?? DateTime.now(),
        startTime = startTime ?? TimeOfDay.now(),
        endTime = endTime ?? TimeOfDay.now();

  EditTaskState copyWith({
    String? id,
    String? title,
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? category,
    String? categoryId,
    bool? isComplete,
    EditTaskStatus? status,
    int? categoryTheme,
  }) {
    return EditTaskState(
        id: id ?? this.id,
        title: title ?? this.title,
        taskDate: taskDate ?? this.taskDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        category: category ?? this.category,
        categoryId: categoryId ?? this.categoryId,
        isComplete: isComplete ?? this.isComplete,
        status: status ?? this.status,
        categoryTheme: categoryTheme ?? this.categoryTheme);
  }

  @override
  List<Object> get props => [
        id,
        title,
        taskDate,
        startTime,
        endTime,
        category,
        categoryId,
        isComplete,
        status,
        categoryTheme,
      ];
}
