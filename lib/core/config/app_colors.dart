import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const white = _white;
  static const dark = _dark;
  static const failure = _red;
  static const success = _limeGreen;
  static const warning = _amber;

  // https://www.color-blindness.com/color-name-hue/
  static const _white = Color(0xFFFFFFFF);
  static const _dark = Color(0x00000000);
  static const _red = Color(0xFFF04D4C);
  static const _limeGreen = Color(0xFF27B34A);
  static const _amber = Color(0xFFFEC110);
}
    