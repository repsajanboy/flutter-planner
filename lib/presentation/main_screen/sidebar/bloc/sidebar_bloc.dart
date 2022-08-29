import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/category/category.dart';
import '../../../../repositories/category_repository.dart';

part 'sidebar_event.dart';
part 'sidebar_state.dart';

class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  SidebarBloc({required this.categoryRepository}) : super(SidebarInitial()) {
    on<CategoriesFetched>(_fetchedCategories);
    on<CategoriesIndexSelected>(
        (event, emit) => emit(state.copyWith(selectedIndex: event.index)));
    on<CategoriesNameSelected>((event, emit) =>
        emit(state.copyWith(selectedCategoryName: event.selectedCategoryName)));
  }

  final CategoryRepository categoryRepository;

  Future<void> _fetchedCategories(
    CategoriesFetched event,
    Emitter<SidebarState> emit,
  ) async {
    try {
      if (state.status == SideBarStatus.initial) {
        final categories = await categoryRepository.fetchCategories();
        emit(state.copyWith(
          status: SideBarStatus.success,
          categories: categories,
          selectedCategoryName: categories[state.selectedIndex].name,
        ));
      } else if(state.status == SideBarStatus.success){
        final categories = await categoryRepository.fetchCategories();
        emit(state.copyWith(
          status: SideBarStatus.success,
          categories: categories,
          selectedCategoryName: categories[state.selectedIndex].name,
        ));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
