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
    on<DefaultThemeLoaded>((event, emit) => emit(ThemeState(
          themeData: appThemeData[AppTheme
              .values[sidebarBloc.state.categories[0].theme]] as ThemeData,
        )));
  }

  final SidebarBloc sidebarBloc;
}
