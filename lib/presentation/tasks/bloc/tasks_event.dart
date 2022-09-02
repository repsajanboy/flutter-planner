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
  final String categoryId;

  TasksListFiltered({required this.categoryId});
}

class ShowAllListSelected extends TasksEvent {}

class ShowActiveListSelected extends TasksEvent {}

class ShowCompletedListSelected extends TasksEvent {}