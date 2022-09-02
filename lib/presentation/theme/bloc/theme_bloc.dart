import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../main_screen/sidebar/sidebar.dart';
import '../theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({required this.sidebarBloc})
      : super(ThemeState(themeData: appThemeData[AppTheme.blue] as ThemeData)) {
    on<ThemeChanged>((event, emit) =>
        emit(ThemeState(themeData: appThemeData[event.theme] as ThemeData)));
    on<DefaultThemeLoaded>(_defaultThemeLoaded);
  }

  final SidebarBloc sidebarBloc;

  Future<void> _defaultThemeLoaded(
    DefaultThemeLoaded event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeState(
      themeData: sidebarBloc.state.categories.isNotEmpty
          ? appThemeData[AppTheme.values[sidebarBloc.state
              .categories[sidebarBloc.state.selectedIndex].theme]] as ThemeData
          : appThemeData[AppTheme.blue] as ThemeData,
    ));
  }
}
