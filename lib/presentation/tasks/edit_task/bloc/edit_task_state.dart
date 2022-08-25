part of 'edit_task_bloc.dart';

abstract class EditTaskState extends Equatable {
  const EditTaskState();
  
  @override
  List<Object> get props => [];
}

class EditTaskInitial extends EditTaskState {}
