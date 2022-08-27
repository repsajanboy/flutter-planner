import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/category/category.dart';
import '../../../../data/category/post_category.dart';
import '../../../../repositories/category_repository.dart';

part 'edit_category_event.dart';
part 'edit_category_state.dart';

class EditCategoryBloc extends Bloc<EditCategoryEvent, EditCategoryState> {
  EditCategoryBloc({required this.categoryRepository})
      : super(EditCategoryInitial()) {
    on<EditCategoryListLoaded>(_editCategoryListData);
    on<EditCategoryDataLoaded>(_editCategoryDataLoaded);
    on<EditCategoryColorChanged>(_editCategoryColorChange);
    on<EditCategoryNameChanged>(_editCategorNameChange);
    on<EditCategorySaved>(_editCategorySaved);
  }

  final CategoryRepository categoryRepository;

  Future<void> _editCategoryListData(
    EditCategoryListLoaded event,
    Emitter<EditCategoryState> emit,
  ) async {
    try {
      final categories = await categoryRepository.fetchCategories();
      emit(EditCategoryListState(categories: categories));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> _editCategoryDataLoaded(
    EditCategoryDataLoaded event,
    Emitter<EditCategoryState> emit,
  ) async {
    emit(EditSingleCategoryState(
      id: event.category.id,
      name: event.category.name,
      theme: event.category.theme,
    ));
  }

  Future<void> _editCategoryColorChange(
    EditCategoryColorChanged event,
    Emitter<EditCategoryState> emit,
  ) async {
    emit(EditSingleCategoryState().copyWith(theme: event.index));
  }

  Future<void> _editCategorNameChange(
    EditCategoryNameChanged event,
    Emitter<EditCategoryState> emit,
  ) async {
    emit(EditSingleCategoryState().copyWith(name: event.name));
  }

  Future<void> _editCategorySaved(
    EditCategorySaved event,
    Emitter<EditCategoryState> emit,
  ) async {
    try {
      var categoryState =  const EditSingleCategoryState();
      final updateCategory = PostCategory(
        id: categoryState.id,
        name: categoryState.name,
        theme: categoryState.theme
      );
      await categoryRepository.updateCategory(updateCategory);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
