part of 'create_task_bloc.dart';

enum CreateTaskStatus {initial, success, error}
class CreateTaskState extends Equatable {
  final String id;
  final String title;
  final DateTime taskDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isComplete;
  final CreateTaskStatus status;

  CreateTaskState({
    this.id = '',
    this.title = '',
    DateTime? taskDate,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    this.isComplete = false,
    this.status = CreateTaskStatus.initial
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
    CreateTaskStatus? status,
  }) {
    return CreateTaskState(
      id: id ?? this.id,
      title: title ?? this.title,
      taskDate: taskDate ?? this.taskDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isComplete: isComplete ?? this.isComplete,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [id, title, taskDate, startTime, endTime, isComplete, status];
}
