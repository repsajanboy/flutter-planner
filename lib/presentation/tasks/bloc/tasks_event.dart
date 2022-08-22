part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class TasksFetched extends TasksEvent {
  TasksFetched();
}

class TaskCompleteChanged extends TasksEvent {
  final bool? isComplete;
  final String? id;

  TaskCompleteChanged({this.isComplete, this.id});
}

class TasksListFiltered extends TasksEvent {
  final String category;

  TasksListFiltered({required this.category});
}