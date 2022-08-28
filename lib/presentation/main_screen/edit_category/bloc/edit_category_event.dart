part of 'edit_category_bloc.dart';

abstract class EditCategoryEvent {}

class EditCategoryListLoaded extends EditCategoryEvent {
  EditCategoryListLoaded();
}

class EditCategoryDataLoaded extends EditCategoryEvent {
  final Category category;

  EditCategoryDataLoaded({required this.category});
}

class EditCategoryColorChanged extends EditCategoryEvent {
  final int? index;

  EditCategoryColorChanged({required this.index});
}

class EditCategoryNameChanged extends EditCategoryEvent {
  final String? name;

  EditCategoryNameChanged({required this.name});
}

class EditCategorySaved extends EditCategoryEvent {
  EditCategorySaved();
}

class DeleteCategorySelected extends EditCategoryEvent {
  final String? id;
  DeleteCategorySelected({this.id});
}