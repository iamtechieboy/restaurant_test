import 'package:flutter/material.dart';

class NavigationBarModel {
  final int index;
  final String title;
  final IconData selectedIcon;
  final IconData unSelectedIcon;

  NavigationBarModel({
    required this.index,
    required this.title,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}

    