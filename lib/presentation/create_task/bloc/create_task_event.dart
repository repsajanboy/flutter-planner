part of 'create_task_bloc.dart';

@immutable
abstract class CreateTaskEvent {}

class CreateTaskTitleChanged extends CreateTaskEvent {
  final String? title;

  CreateTaskTitleChanged({required this.title});
}

class CreateTaskDateChanged extends CreateTaskEvent {
  final DateTime? taskDate;

  CreateTaskDateChanged({required this.taskDate});
}

class CreateTaskStartTimeChanged extends CreateTaskEvent {
  final TimeOfDay? startTime;

  CreateTaskStartTimeChanged({required this.startTime});
}

class CreateTaskEndTimeChanged extends CreateTaskEvent {
  final TimeOfDay? endTime;

  CreateTaskEndTimeChanged({required this.endTime});
}

class CreateTaskSaved extends CreateTaskEvent {}