import 'package:cropify_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/category_model.dart';
import '../screens/all_categories_screen.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryModel(
        title: "Vegetables",
        icon: Icons.eco,
        bgColor: const Color(0xFFE7F8EC),
        iconColor: Colors.green,
        itemCount: 120,
      ),

      CategoryModel(
        title: "Fruits",
        icon: Icons.apple,
        bgColor: const Color(0xFFFFECE8),
        iconColor: Colors.red,
        itemCount: 80,
      ),

      CategoryModel(
        title: "Dairy",
        icon: Icons.local_drink,
        bgColor: const Color(0xFFEAF3FF),
        iconColor: Colors.blue,
        itemCount: 45,
      ),

      CategoryModel(
        title: "Meat",
        icon: Icons.set_meal,
        bgColor: const Color(0xFFFFEAEA),
        iconColor: Colors.red,
        itemCount: 30,
      ),

      CategoryModel(
        title: "Seafood",
        icon: Icons.phishing,
        bgColor: const Color(0xFFE1F5FE),
        iconColor: Colors.lightBlue,
        itemCount: 25,
      ),

      CategoryModel(
        title: "Others",
        icon: Icons.rice_bowl,
        bgColor: const Color(0xFFFFF4DD),
        iconColor: Colors.orange,
        itemCount: 60,
      ),
    ];

    return Column(
      children: [
        /// Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              TextButton(
                onPressed: () {
                  context.pushNamed(
                    RouteNames.allCategories,
                    extra: categories,
                  );
                },
                child: const Text(
                  "See all",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// Horizontal Categories
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CategoryItem(category: category),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
