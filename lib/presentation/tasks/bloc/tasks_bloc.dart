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
    on<ShowAllListSelected>(_showAllTasksList);
    on<ShowActiveListSelected>(_showActiveTasksList);
    on<ShowCompletedListSelected>(_showCompletedTasksList);
    on<TasksWithNoCategoriesLoaded>(_taskWithNoCategoriesLoaded);
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
        List<Task> filteredTasks = [];
        if (sidebarBloc.state.categories.isNotEmpty) {
          filteredTasks = tasks
              .where((e) =>
                  e.categoryId ==
                  sidebarBloc
                      .state.categories[sidebarBloc.state.selectedIndex].id)
              .toList();
        }
        filteredTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
        emit(state.copyWith(
          status: TaskStatus.success,
          tasks: tasks,
          filteredTasks: filteredTasks,
          isCompletedEmpty: '',
        ));
      } else {
        final tasks = await taskRepository.fetchTasks();
        List<Task> filteredTasks = [];
        if (sidebarBloc.state.categories.isNotEmpty) {
          filteredTasks = tasks
              .where((e) =>
                  e.categoryId ==
                  sidebarBloc
                      .state.categories[sidebarBloc.state.selectedIndex].id)
              .toList();
        }
        filteredTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
        emit(state.copyWith(
          status: TaskStatus.success,
          tasks: tasks,
          filteredTasks: filteredTasks,
          isCompletedEmpty: '',
        ));
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
        isCompletedEmpty: '',
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
      final isComplete = event.isComplete! == false ? 0 : 1;
      await taskRepository.completeTask(event.id!, isComplete);
      final tasks = await taskRepository.fetchTasks();
      List<Task> filteredTasks = [];
      if (sidebarBloc.state.categories.isNotEmpty) {
        filteredTasks = tasks
            .where((e) =>
                e.categoryId ==
                sidebarBloc
                    .state.categories[sidebarBloc.state.selectedIndex].id)
            .toList();
      }
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

  Future<void> _showAllTasksList(
    ShowAllListSelected event,
    Emitter<TasksState> emit,
  ) async {
    final tasks = state.tasks;
    final filteredTasks = tasks
        .where((e) =>
            e.categoryId ==
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].id)
        .toList();
    filteredTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
    emit(state.copyWith(
      status: TaskStatus.success,
      tasks: tasks,
      filteredTasks: filteredTasks,
    ));
  }

  Future<void> _showActiveTasksList(
    ShowActiveListSelected event,
    Emitter<TasksState> emit,
  ) async {
    final tasks = state.tasks;
    final filteredTasks = tasks
        .where((e) =>
            e.categoryId ==
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].id)
        .toList();

    final activeTasks =
        filteredTasks.where((a) => a.isComplete == false).toList();
    activeTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
    emit(state.copyWith(
      status: TaskStatus.success,
      tasks: tasks,
      filteredTasks: activeTasks,
    ));
  }

  Future<void> _showCompletedTasksList(
    ShowCompletedListSelected event,
    Emitter<TasksState> emit,
  ) async {
    final tasks = await taskRepository.fetchTasks();
    final filteredTasks = tasks
        .where((e) =>
            e.categoryId ==
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].id)
        .toList();
    final activeTasks =
        filteredTasks.where((a) => a.isComplete == true).toList();
    activeTasks.sort((a, b) => a.startTime.compareTo(b.startTime));
    emit(state.copyWith(
      status: TaskStatus.success,
      tasks: tasks,
      filteredTasks: activeTasks,
      isCompletedEmpty: activeTasks.isEmpty ? 'empty' : '',
    ));
  }

  Future<void> _taskWithNoCategoriesLoaded(
    TasksWithNoCategoriesLoaded event,
    Emitter<TasksState> emit,
  ) async {
    final tasks = await taskRepository.fetchTasks();
    final categories = sidebarBloc.state.categories;

    final List<Task> noCategories = [];
    if (categories.isNotEmpty) {
      for (var e in tasks) {
          if (categories.where((category) => category.id == e.categoryId).isEmpty) {
            noCategories.add(e);
          }
        }
    } else {
      for (var e in tasks) {
        noCategories.add(e);
      }
    }

    emit(state.copyWith(noCategortTasks: noCategories));
  }
}
