import 'package:flutter/material.dart';

class AppColors {
  final Color primary;
  final Color background;

  const AppColors({
    required this.primary,
    required this.background,
  });

  factory AppColors.light() {
    return  AppColors(
      primary: Colors.blue,
      background: Colors.grey.shade200,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: Colors.red,
      background: Colors.black,
    );
  }
}
