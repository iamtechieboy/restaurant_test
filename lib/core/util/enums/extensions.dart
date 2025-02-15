import 'package:flutter/material.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/config/app_icons.dart';

/// Enum for pop up status
enum PopUpStatus {
  failure(AppIcons.failure, AppColors.failure),
  success(AppIcons.success, AppColors.success),
  warning(AppIcons.warning, AppColors.warning);

  final String icon;
  final Color color;

  const PopUpStatus(this.icon, this.color);

  bool get isFailure => this == PopUpStatus.failure;

  bool get isSuccess => this == PopUpStatus.success;

  bool get isWarning => this == PopUpStatus.warning;
}
    