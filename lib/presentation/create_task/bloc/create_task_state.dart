part of 'create_task_bloc.dart';

class CreateTaskState extends Equatable {
  final String id;
  final String title;
  final DateTime taskDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isComplete;

  CreateTaskState({
    this.id = '',
    this.title = '',
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    this.isComplete = false,
  })  : taskDate = taskDate ?? DateTime.now(),
        startTime = startTime ?? TimeOfDay.now(),
        endTime = endTime ?? TimeOfDay.now();

  CreateTaskState copyWith({
    String? id,
    String? title,
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    bool? isComplete,
  }) {
    return CreateTaskState(
      id: id ?? this.id,
      title: title ?? this.title,
      taskDate: taskDate ?? this.taskDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isComplete: isComplete ?? this.isComplete
    );
  }

  @override
  List<Object> get props => [id, title, taskDate, startTime, endTime, isComplete];
}
