part of 'tasks_bloc.dart';

enum TaskStatus { initial, success, error }

class TasksState extends Equatable {
  final TaskStatus status;
  final List<Task> tasks;
  final List<Task> filteredTasks;
  final String isCompletedEmpty;
  final List<Task> noCategortTasks;

  const TasksState({
    this.status = TaskStatus.initial,
    this.tasks = const <Task>[],
    this.filteredTasks = const <Task>[],
    this.isCompletedEmpty = '',
    this.noCategortTasks = const <Task>[],
  });

  TasksState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
    List<Task>? filteredTasks,
    String? isCompletedEmpty,
    List<Task>? noCategortTasks,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      isCompletedEmpty: isCompletedEmpty ?? this.isCompletedEmpty,
      noCategortTasks: noCategortTasks ?? this.noCategortTasks,
    );
  }

  @override
  List<Object> get props => [status, tasks, filteredTasks, isCompletedEmpty, noCategortTasks];
}
class TasksInitial extends TasksState {}