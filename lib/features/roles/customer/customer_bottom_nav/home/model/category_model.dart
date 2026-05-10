import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final int itemCount;

  CategoryModel({
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.itemCount,
  });
}
