import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.normal, color: Colors.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 26, fontWeight: FontWeight.normal, color: Colors.black),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    titleLarge: const TextStyle().copyWith(
        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
  );
}
