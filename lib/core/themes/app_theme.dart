import 'package:contactcars_app_retail/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    cardColor: AppColors.colorWhite900,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: const AppBarTheme(),
    textTheme: const TextTheme(),
  );
}
