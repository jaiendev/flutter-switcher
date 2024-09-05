import 'package:button_switch_ui/src/theme_bloc/theme_state.dart';
import 'package:button_switch_ui/src/theme_bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeMode currentThemeMode = ThemeMode.light;

  ThemeBloc() : super(InitialThemeState()) {
    on<ThemeEvent>(
      (event, emit) async {
        if (event is InitialThemeEvent) {
          emit(ThemeUpdated(mode: currentThemeMode));
        }

        if (event is OnChangeThemeEvent) {
          currentThemeMode = event.themeMode ?? ThemeMode.light;

          emit(ThemeUpdated(mode: currentThemeMode));
        }
      },
    );
  }
}
