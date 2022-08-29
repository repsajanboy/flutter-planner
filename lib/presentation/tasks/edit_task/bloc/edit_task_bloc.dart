import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../data/tasks/post_task.dart';
import '../../../../data/tasks/task.dart';
import '../../../../repositories/task_repository.dart';
import '../../../main_screen/sidebar/sidebar.dart';

part 'edit_task_event.dart';
part 'edit_task_state.dart';

class EditTaskBloc extends Bloc<EditTaskEvent, EditTaskState> {
  EditTaskBloc({required this.sidebarBloc, required this.taskRepository})
      : super(EditTaskState()) {
    on<EditTaskDataLoaded>(_loadEditData);
    on<EditTaskTitleChanged>(
        (event, emit) => emit(state.copyWith(title: event.title)));
    on<EditTaskTaskDateChanged>(
        (event, emit) => emit(state.copyWith(taskDate: event.taskDate)));
    on<EditTaskStartTimeChanged>(
        (event, emit) => emit(state.copyWith(startTime: event.startTime)));
    on<EditTaskEndTimeChanged>(
        (event, emit) => emit(state.copyWith(endTime: event.endTime)));
    on<EditTaskCategoryChanged>((event, emit) => emit(state.copyWith(
        category: event.category, categoryId: event.categoryId, categoryTheme: event.categoryTheme)));
    on<EditTaskSaved>(_updateTask);
    on<DeleteTaskSelected>(_deleteTask);
  }
  final TaskRepository taskRepository;
  final SidebarBloc sidebarBloc;

  Future<void> _loadEditData(
    EditTaskDataLoaded event,
    Emitter<EditTaskState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.task.id,
        title: event.task.title,
        taskDate: event.task.taskDate,
        startTime: TimeOfDay.fromDateTime(event.task.startTime),
        endTime: TimeOfDay.fromDateTime(event.task.endTime),
        category: sidebarBloc.state.categories.firstWhere((e) => e.id == event.task.categoryId).name,
        isComplete: event.task.isComplete,
        status: EditTaskStatus.initial,
        categoryTheme:
            sidebarBloc.state.categories[sidebarBloc.state.selectedIndex].theme,
      ),
    );
  }

  Future<void> _updateTask(
    EditTaskSaved event,
    Emitter<EditTaskState> emit,
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
    final updateTask = PostTask(
      id: state.id,
      title: state.title,
      taskDate: state.taskDate,
      startTime: _startTime,
      endTime: _endTime,
      category: state.category,
      categoryId: state.categoryId,
      isComplete: state.isComplete,
    );

    try {
      await taskRepository.updateTask(updateTask);
      emit(state.copyWith(status: EditTaskStatus.success));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _deleteTask(
    DeleteTaskSelected event,
    Emitter<EditTaskState> emit,
  ) async {
    try{
      await taskRepository.deleteTask(event.id!);
      emit(state.copyWith(status: EditTaskStatus.success));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
