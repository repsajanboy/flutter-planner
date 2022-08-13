import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../data/tasks/task.dart';
import '../../../repositories/task_repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required this.taskRepository}) : super(TasksInitial()) {
    on<TasksFetched>(_fetchedTask);
    on<TaskCompleteChanged>(_completeTask);
  }

  final TaskRepository taskRepository;

  Future<void> _fetchedTask(
    TasksFetched event,
    Emitter<TasksState> emit,
  ) async {
    try {
      if (state.status == TaskStatus.initial) {
        final tasks = await taskRepository.fetchTasks();
        emit(state.copyWith(
          status: TaskStatus.success,
          tasks: tasks,
        ));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _completeTask(
    TaskCompleteChanged event,
    Emitter<TasksState> emit,
  ) async {
    try {
      await taskRepository.completeTask(event.id!, event.isComplete!);
      final tasks = await taskRepository.fetchTasks();
      emit(state.copyWith(
        status: TaskStatus.success,
        tasks: tasks,
      ));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
