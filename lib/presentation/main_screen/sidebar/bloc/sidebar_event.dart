part of 'sidebar_bloc.dart';

abstract class SidebarEvent {}

class CategoriesFetched extends SidebarEvent {
  CategoriesFetched();
}

class CategoriesIndexSelected extends SidebarEvent {
 final int? index;

  CategoriesIndexSelected({this.index});
}

class CategoriesNameSelected extends SidebarEvent {
  final String? selectedCategoryName;

  CategoriesNameSelected({this.selectedCategoryName});
}