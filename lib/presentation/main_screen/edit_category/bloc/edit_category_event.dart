part of 'edit_category_bloc.dart';

abstract class EditCategoryEvent extends Equatable {
  const EditCategoryEvent();
}

class EditCategoryListLoaded extends EditCategoryEvent {
  const EditCategoryListLoaded();

  @override
  List<Object> get props => [];
}

class EditCategoryDataLoaded extends EditCategoryEvent {
  final Category category;

  const EditCategoryDataLoaded({required this.category});

  @override
  List<Object> get props => [category];
}

class EditCategoryColorChanged extends EditCategoryEvent {
  final int? index;

  const EditCategoryColorChanged({required this.index});

  @override
  List<Object> get props => [index!];
}

class EditCategoryNameChanged extends EditCategoryEvent {
  final String? name;

  const EditCategoryNameChanged({required this.name});

  @override
  List<Object> get props => [name!];
}

class EditCategorySaved extends EditCategoryEvent {
  const EditCategorySaved();

  @override
  List<Object> get props => [];
}