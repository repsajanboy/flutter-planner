part of 'sidebar_bloc.dart';

enum SideBarStatus { initial, success, error }

class SidebarState extends Equatable {
  final SideBarStatus status;
  final List<Category> categories;
  final int selectedIndex;
  final String selectedCategoryName;

  const SidebarState({
    this.status = SideBarStatus.initial,
    this.categories = const <Category>[],
    this.selectedIndex = 0,
    this.selectedCategoryName = '',
  });

  SidebarState copyWith({
    SideBarStatus? status,
    List<Category>? categories,
    int? selectedIndex,
    String? selectedCategoryName,
  }) {
    return SidebarState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedCategoryName: selectedCategoryName ?? this.selectedCategoryName,
    );
  }

  @override
  List<Object> get props => [status, categories, selectedIndex, selectedCategoryName];
}

class SidebarInitial extends SidebarState {}
