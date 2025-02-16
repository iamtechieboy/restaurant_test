import 'package:flutter/material.dart';
import 'package:restaurant_test/core/config/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      dividerColor: Colors.transparent
    ),

    textTheme: const TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
    ),
  );

  static const displayLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const displayMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const displaySmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const headlineLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const titleLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const bodyLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const bodyMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const labelLarge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
  static const labelMedium = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
    letterSpacing: -0.2,
  );
}
