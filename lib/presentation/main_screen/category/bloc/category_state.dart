part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final int selectedTheme;
  final String categoryName;

  const CategoryState({
    this.selectedTheme = 0,
    this.categoryName = '',
  });

  CategoryState copyWith({
    int? selectedTheme,
    String? categoryName,
  }) {
    return CategoryState(
      selectedTheme: selectedTheme ?? this.selectedTheme,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  List<Object> get props => [selectedTheme, categoryName];
}

class CategoryInitial extends CategoryState {}
