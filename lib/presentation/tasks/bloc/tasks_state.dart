part of 'tasks_bloc.dart';

enum TaskStatus { initial, success, error }

class TasksState extends Equatable {
  final TaskStatus status;
  final List<Task> tasks;
  final List<Task> filteredTasks;

  const TasksState({
    this.status = TaskStatus.initial,
    this.tasks = const <Task>[],
    this.filteredTasks = const <Task>[],
  });

  TasksState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
    List<Task>? filteredTasks,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
    );
  }

  @override
  List<Object> get props => [status, tasks, filteredTasks];
}
class TasksInitial extends TasksState {}