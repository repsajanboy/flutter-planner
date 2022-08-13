import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: appThemeData[AppTheme.blue] as ThemeData)) {
    on<ThemeChanged>((event, emit) =>
        emit(ThemeState(themeData: appThemeData[event.theme] as ThemeData)));
  }
}
