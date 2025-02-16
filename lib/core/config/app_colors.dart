import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const white = Color(0xFFFFFFFF);
  static const dark = Color(0xFF000000);
  static const failure = Color(0xFFF04D4C);
  static const success = Color(0xFF27B34A);
  static const warning = Color(0xFFFEC110);

  static GrayColor gray = GrayColor();
  static BlueColor blue = BlueColor();
}

class GrayColor extends ColorSwatch<String> {
  GrayColor()
      : super(
          0xFF6B7280,
          <String, Color>{
            "50": const Color(0xFFF9FAFB),
            "100": const Color(0xFFF3F4F6),
            "200": const Color(0xFFE5E7EB),
            "300": const Color(0xFFD1D5DB),
            "400": const Color(0xFF9CA3AF),
            "500": const Color(0xFF6B7280),
            "600": const Color(0xFF4B5563),
            "700": const Color(0xFF374151),
            "800": const Color(0xFF374151),
            "900": const Color(0xFF374151),
          },
        );

  Color get gray50 => this["50"]!;

  Color get gray100 => this["100"]!;

  Color get gray200 => this["200"]!;

  Color get gray300 => this["300"]!;

  Color get gray400 => this["400"]!;

  Color get gray500 => this["500"]!;

  Color get gray600 => this["600"]!;

  Color get gray700 => this["700"]!;

  Color get gray800 => this["800"]!;

  Color get gray900 => this["900"]!;
}

class BlueColor extends ColorSwatch<String> {
  BlueColor()
      : super(
          0xFF3B82F6,
          <String, Color>{
            "50": const Color(0xFFEFF6FF),
            "100": const Color(0xFFDBEAFE),
            "200": const Color(0xFFBFDBFE),
            "300": const Color(0xFF93C5FD),
            "400": const Color(0xFF60A5FA),
            "500": const Color(0xFF3B82F6),
            "600": const Color(0xFF2563EB),
            "700": const Color(0xFF1D4ED8),
            "800": const Color(0xFF1E40AF),
            "900": const Color(0xFF1E3A8A),
          },
        );

  Color get blue50 => this["50"]!;

  Color get blue100 => this["100"]!;

  Color get blue200 => this["200"]!;

  Color get blue300 => this["300"]!;

  Color get blue400 => this["400"]!;

  Color get blue500 => this["500"]!;

  Color get blue600 => this["600"]!;

  Color get blue700 => this["700"]!;

  Color get blue800 => this["800"]!;

  Color get blue900 => this["900"]!;
}
