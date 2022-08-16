part of 'sidebar_bloc.dart';

enum SideBarStatus { initial, success, error }

class SidebarState extends Equatable {
  final SideBarStatus status;
  final List<Category> categories;

  const SidebarState({
    this.status = SideBarStatus.initial,
    this.categories = const <Category>[],
  });

  SidebarState copyWith({
    SideBarStatus? status,
    List<Category>? categories,
  }) {
    return SidebarState(
      status: status ?? this.status,
      categories: categories ?? this.categories
    );
  }

  @override
  List<Object> get props => [status, categories];
}

class SidebarInitial extends SidebarState {}
