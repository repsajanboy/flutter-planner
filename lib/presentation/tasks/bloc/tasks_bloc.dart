import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../data/tasks/task.dart';
import '../../../repositories/task_repository.dart';
import '../../main_screen/sidebar/sidebar.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required this.taskRepository, required this.sidebarBloc})
      : super(TasksInitial()) {
    on<TasksFetched>(_fetchedTask);
    on<TaskCompleteChanged>(_completeTask);
    on<TasksListFiltered>(_filteredTask);
  }

  final TaskRepository taskRepository;
  final SidebarBloc sidebarBloc;

  Future<void> _fetchedTask(
    TasksFetched event,
    Emitter<TasksState> emit,
  ) async {
    try {
      if (state.status == TaskStatus.initial) {
        final tasks = await taskRepository.fetchTasks();
        final filteredTasks = tasks
            .where((e) => e.categoryId == sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].id)
            .toList();
        filteredTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
        emit(state.copyWith(
            status: TaskStatus.success,
            tasks: tasks,
            filteredTasks: filteredTasks));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _filteredTask(
    TasksListFiltered event,
    Emitter<TasksState> emit,
  ) async {
    try {
      emit(state.copyWith(filteredTasks: []));
      final tasks = await taskRepository.fetchTasks();
      final filteredTasks =
          tasks.where((e) => e.categoryId == event.categoryId).toList();
      filteredTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
      emit(state.copyWith(
        status: TaskStatus.success,
        tasks: tasks,
        filteredTasks: filteredTasks,
      ));
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
      final filteredTasks = tasks
          .where((e) =>
              e.categoryId ==
              sidebarBloc
                  .state.categories[sidebarBloc.state.selectedIndex].id)
          .toList();
      emit(state.copyWith(
        status: TaskStatus.success,
        tasks: tasks,
        filteredTasks: filteredTasks,
      ));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
