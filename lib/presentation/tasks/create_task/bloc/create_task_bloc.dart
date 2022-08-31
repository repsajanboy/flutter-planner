import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../repositories/task_repository.dart';
import '../../../../data/tasks/post_task.dart';
import '../../../main_screen/sidebar/sidebar.dart';

part 'create_task_event.dart';
part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  CreateTaskBloc({required this.sidebarBloc, required this.taskRepository})
      : super(CreateTaskState()) {
    on<CreateTaskTitleChanged>(
        (event, emit) => emit(state.copyWith(title: event.title)));
    on<CreateTaskDateChanged>(
        (event, emit) => emit(state.copyWith(taskDate: event.taskDate)));
    on<CreateTaskStartTimeChanged>(
        (event, emit) => emit(state.copyWith(startTime: event.startTime)));
    on<CreateTaskEndTimeChanged>(
        (event, emit) => emit(state.copyWith(endTime: event.endTime)));
    on<CreateTaskCategoryChanged>((event, emit) => emit(state.copyWith(
        category: event.category,
        categoryId: event.categoryId,
        categoryTheme: event.categoryTheme)));
    on<CreateTaskCategoryIndexLoaded>(
      (event, emit) => emit(state.copyWith(
        category:
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].name,
        categoryId:
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].id,
        categoryTheme:
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].theme,
        isCategoryLoaded: true,
      )),
    );
    on<CreateTaskSaved>(_postTask);
    on<CreateTaskBackToInitial>(((event, emit) =>
        emit(state.copyWith(status: CreateTaskStatus.initial))));
  }

  final TaskRepository taskRepository;
  final SidebarBloc sidebarBloc;

  Future<void> _postTask(
    CreateTaskSaved event,
    Emitter<CreateTaskState> emit,
  ) async {
    DateTime _startTime = DateTime(
      state.taskDate.year,
      state.taskDate.month,
      state.taskDate.day,
      state.startTime.hour,
      state.startTime.minute,
    );
    DateTime _endTime = DateTime(
      state.taskDate.year,
      state.taskDate.month,
      state.taskDate.day,
      state.endTime.hour,
      state.endTime.minute,
    );
    final postTask = PostTask(
        title: state.title,
        taskDate: state.taskDate,
        startTime: _startTime,
        endTime: _endTime,
        category: state.category,
        categoryId: state.categoryId,
        isComplete: state.isComplete);
    try {
      await taskRepository.postTask(postTask);
      emit(state.copyWith(status: CreateTaskStatus.success));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
