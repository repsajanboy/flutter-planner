part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

class TasksFetched extends TasksEvent {
  const TasksFetched();

  @override
  List<Object> get props => [];
}
