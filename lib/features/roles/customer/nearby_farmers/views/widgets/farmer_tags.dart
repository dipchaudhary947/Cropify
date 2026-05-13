import 'package:flutter/material.dart';

import 'farmer_category_chip.dart';

class FarmerTags extends StatelessWidget {
  final List<String> tags;

  const FarmerTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: tags.map((tag) {
        return FarmerCategoryChip(title: tag);
      }).toList(),
    );
  }
}
