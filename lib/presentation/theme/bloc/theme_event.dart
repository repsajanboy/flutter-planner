part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({required this.theme});
}