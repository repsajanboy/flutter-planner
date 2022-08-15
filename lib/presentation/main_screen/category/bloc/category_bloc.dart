import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/category/post_category.dart';
import '../../../../repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.categoryRepository})
      : super(const CategoryState()) {
    on<CategoryColorChanged>(
      (event, emit) => emit(state.copyWith(selectedTheme: event.index)),
    );
    on<CategoryNameChanged>(
      (event, emit) => emit(state.copyWith(categoryName: event.categoryName)),
    );
    on<CreateCategorySaved>(_postCategory);
  }

  final CategoryRepository categoryRepository;

  Future<void> _postCategory(
    CreateCategorySaved event,
    Emitter<CategoryState> emit,
  ) async {
    final postCategory = PostCategory(
      name: state.categoryName,
      theme: state.selectedTheme,
    );
    try {
      await categoryRepository.postCategory(postCategory);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
