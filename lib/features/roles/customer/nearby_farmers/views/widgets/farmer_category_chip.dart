import 'package:flutter/material.dart';

class FarmerCategoryChip extends StatelessWidget {
  final String title;

  const FarmerCategoryChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(title, style: const TextStyle(fontSize: 11)),
    );
  }
}
