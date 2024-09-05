import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class InitialThemeEvent extends ThemeEvent {
  final ThemeMode? themeMode;

  InitialThemeEvent({
    this.themeMode,
  });
}

class OnChangeThemeEvent extends ThemeEvent {
  final ThemeMode? themeMode;

  OnChangeThemeEvent({
    this.themeMode,
  });
}
