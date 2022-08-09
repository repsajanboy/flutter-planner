part of 'tasks_bloc.dart';

enum TaskStatus { initial, success, error }

class TasksState extends Equatable {
  final TaskStatus status;
  final List<Task> tasks;

  const TasksState({
    this.status = TaskStatus.initial,
    this.tasks = const <Task>[],
  });

  TasksState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [status, tasks];
}
class TasksInitial extends TasksState {}