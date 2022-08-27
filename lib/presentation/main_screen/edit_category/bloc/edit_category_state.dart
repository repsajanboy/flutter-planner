part of 'edit_category_bloc.dart';

abstract class EditCategoryState extends Equatable {
  const EditCategoryState();

  @override
  List<Object> get props => [];
}

class EditCategoryInitial extends EditCategoryState {}

class EditCategoryListState extends EditCategoryState {
  final List<Category> categories;

  const EditCategoryListState({required this.categories});

  @override
  List<Object> get props => [categories];
}

class EditSingleCategoryState extends EditCategoryState {
  final String id;
  final String name;
  final int theme;

  const EditSingleCategoryState({
    this.id = '',
    this.name = '',
    this.theme = 0,
  });

  EditSingleCategoryState copyWith({
    String? id,
    String? name,
    int? theme,
  }) {
    return EditSingleCategoryState(
      id: id ?? this.id,
      name: name ?? this.name,
      theme: theme ?? this.theme
    );
  }

  @override
  List<Object> get props => [id, name, theme];
}
