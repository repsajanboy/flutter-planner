import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/category/category.dart';
import '../../../../data/category/post_category.dart';
import '../../../../repositories/category_repository.dart';

part 'edit_category_event.dart';
part 'edit_category_state.dart';

class EditCategoryBloc extends Bloc<EditCategoryEvent, EditCategoryState> {
  EditCategoryBloc({required this.categoryRepository})
      : super(const EditCategoryState()) {
    on<EditCategoryListLoaded>(_editCategoryListData);
    on<EditCategoryDataLoaded>(_editCategoryDataLoaded);
    on<EditCategoryColorChanged>(
        (event, emit) => emit(state.copyWith(theme: event.index)));
    on<EditCategoryNameChanged>(
        (event, emit) => emit(state.copyWith(name: event.name)));
    on<EditCategorySaved>(_editCategorySaved);
    on<DeleteCategorySelected>(_deleteCategorySelected);
  }

  final CategoryRepository categoryRepository;

  Future<void> _editCategoryListData(
    EditCategoryListLoaded event,
    Emitter<EditCategoryState> emit,
  ) async {
    try {
      final categories = await categoryRepository.fetchCategories();
      emit(state.copyWith(categories: categories, isSuccessfullyDeleted: false));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _editCategoryDataLoaded(
    EditCategoryDataLoaded event,
    Emitter<EditCategoryState> emit,
  ) async {
    emit(state.copyWith(
      id: event.category.id,
      name: event.category.name,
      theme: event.category.theme,
    ));
  }

  Future<void> _editCategorySaved(
    EditCategorySaved event,
    Emitter<EditCategoryState> emit,
  ) async {
    try {
      final updateCategory = PostCategory(
        id: state.id,
        name: state.name,
        theme: state.theme,
      );
      await categoryRepository.updateCategory(updateCategory);
      final categories = await categoryRepository.fetchCategories();
      emit(state.copyWith(categories: categories));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _deleteCategorySelected(
    DeleteCategorySelected event,
    Emitter<EditCategoryState> emit,
  ) async {
    await categoryRepository.deleteCategory(event.id!);
    final categories = await categoryRepository.fetchCategories();
    emit(state.copyWith(categories: categories, isSuccessfullyDeleted: true));
  }
}
