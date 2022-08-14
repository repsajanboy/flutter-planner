import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<CategoryColorChanged>(
      (event, emit) => emit(state.copyWith(selectedTheme: event.index)),
    );
    on<CategoryNameChanged>(
      (event, emit) => emit(state.copyWith(categoryName: event.categoryName)),
    );
  }
}
