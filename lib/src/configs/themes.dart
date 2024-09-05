import 'dart:io';

import 'package:button_switch_ui/src/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTheme {
  AppTheme({
    required this.data,
  });

  factory AppTheme.light() {
    final appColors = AppColors.light();
    final themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: appColors.primary,
      scaffoldBackgroundColor: appColors.background,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        surfaceTintColor: appColors.background,
        backgroundColor: appColors.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: Brightness.light ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
        ),
      ),
    );
    return AppTheme(
      data: themeData,
    );
  }

  factory AppTheme.dark() {
    final appColors = AppColors.dark();
    final themeData = ThemeData(
      brightness: Brightness.dark,
      primaryColor: appColors.primary,
      scaffoldBackgroundColor: appColors.background,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        surfaceTintColor: appColors.background,
        backgroundColor: appColors.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: Brightness.dark ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
        ),
      ),
    );
    return AppTheme(
      data: themeData,
    );
  }

  final ThemeData data;
}
