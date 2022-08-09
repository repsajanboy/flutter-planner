import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../repositories/task_repository.dart';
import '../../../data/tasks/post_task.dart';

part 'create_task_event.dart';
part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  CreateTaskBloc({required this.taskRepository}) : super(CreateTaskState()) {
    on<CreateTaskTitleChanged>(
        (event, emit) => emit(state.copyWith(title: event.title)));
    on<CreateTaskDateChanged>(
        (event, emit) => emit(state.copyWith(taskDate: event.taskDate)));
    on<CreateTaskStartTimeChanged>(
        (event, emit) => emit(state.copyWith(startTime: event.startTime)));
    on<CreateTaskEndTimeChanged>(
        (event, emit) => emit(state.copyWith(endTime: event.endTime)));
    on<CreateTaskSaved>(_postTask);
  }

  final TaskRepository taskRepository;

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
        isComplete: state.isComplete);
    try {
      await taskRepository.postTask(postTask);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
