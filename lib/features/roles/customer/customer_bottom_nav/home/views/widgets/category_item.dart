import 'package:flutter/material.dart';

import '../../model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryItem({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: category.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(category.icon, color: category.iconColor, size: 30),
          ),

          const SizedBox(height: 8),

          Text(
            category.title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
