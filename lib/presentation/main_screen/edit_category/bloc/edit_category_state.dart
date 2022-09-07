part of 'edit_category_bloc.dart';

class EditCategoryState extends Equatable {
  final List<Category> categories;
  final String id;
  final String name;
  final int theme;
  final bool isSuccessfullyDeleted;

  const EditCategoryState({
    this.categories = const <Category>[],
    this.id = '',
    this.name = '',
    this.theme = 0,
    this.isSuccessfullyDeleted = false,
  });

  EditCategoryState copyWith({
    List<Category>? categories,
    String? id,
    String? name,
    int? theme,
    bool? isSuccessfullyDeleted,
  }) {
    return EditCategoryState(
      categories: categories ?? this.categories,
      id: id ?? this.id,
      name: name ?? this.name,
      theme: theme ?? this.theme,
      isSuccessfullyDeleted: isSuccessfullyDeleted ?? this.isSuccessfullyDeleted
    );
  }

  @override
  List<Object> get props => [categories, id, name, theme, isSuccessfullyDeleted];
}

class EditCategoryInitial extends EditCategoryState {}
