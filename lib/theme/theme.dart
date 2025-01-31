import 'package:flutter/material.dart';
import 'colors/app_colors.dart';
import 'text_theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.mainBg,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    secondaryHeaderColor: AppColors.secondary,
    textTheme: AppTextTheme.textTheme,
    fontFamily: 'Satoshi',
  );
}
