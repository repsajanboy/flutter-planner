part of 'category_bloc.dart';

abstract class CategoryEvent {}

class CategoryColorChanged extends CategoryEvent {
  final int index;

  CategoryColorChanged({required this.index});
}

class CategoryNameChanged extends CategoryEvent {
  final String? categoryName;

  CategoryNameChanged({this.categoryName});
}
