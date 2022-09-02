part of 'tasks_bloc.dart';

enum TaskStatus { initial, success, error }

class TasksState extends Equatable {
  final TaskStatus status;
  final List<Task> tasks;
  final List<Task> filteredTasks;
  final String isCompletedEmpty;

  const TasksState({
    this.status = TaskStatus.initial,
    this.tasks = const <Task>[],
    this.filteredTasks = const <Task>[],
    this.isCompletedEmpty = '',
  });

  TasksState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
    List<Task>? filteredTasks,
    String? isCompletedEmpty,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      isCompletedEmpty: isCompletedEmpty ?? this.isCompletedEmpty
    );
  }

  @override
  List<Object> get props => [status, tasks, filteredTasks, isCompletedEmpty];
}
class TasksInitial extends TasksState {}