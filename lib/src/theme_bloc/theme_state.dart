import 'package:flutter/material.dart';

abstract class ThemeState {}

class InitialThemeState extends ThemeState {}

class ThemeUpdated extends ThemeState {
  final ThemeMode mode;
  ThemeUpdated({required this.mode});
}
