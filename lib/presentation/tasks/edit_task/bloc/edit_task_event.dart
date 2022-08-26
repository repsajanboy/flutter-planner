part of 'edit_task_bloc.dart';

abstract class EditTaskEvent {}

class EditTaskDataLoaded extends EditTaskEvent {
  final Task task;
  //final int categoryTheme;
  EditTaskDataLoaded({required this.task});
}

class EditTaskTitleChanged extends EditTaskEvent {
  final String? title;

  EditTaskTitleChanged({required this.title});
}

class EditTaskTaskDateChanged extends EditTaskEvent {
  final DateTime? taskDate;

  EditTaskTaskDateChanged({required this.taskDate});
}

class EditTaskStartTimeChanged extends EditTaskEvent {
  final TimeOfDay? startTime;

  EditTaskStartTimeChanged({required this.startTime});
}

class EditTaskEndTimeChanged extends EditTaskEvent {
  final TimeOfDay? endTime;

  EditTaskEndTimeChanged({required this.endTime});
}

class EditTaskCategoryChanged extends EditTaskEvent {
  final String? category;
  final int? categoryTheme;

  EditTaskCategoryChanged({required this.category, required this.categoryTheme});
}

class DeleteTaskSelected extends EditTaskEvent {
  final String? id;

  DeleteTaskSelected({required this.id});

}

class EditTaskSaved extends EditTaskEvent {}