import 'package:flutter/material.dart';

import '../../model/farmer_filter_type.dart';

class FarmerFilterChips extends StatelessWidget {
  final FarmerFilterType selectedFilter;
  final Function(FarmerFilterType) onSelected;

  const FarmerFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onSelected,
  });

  String getTitle(FarmerFilterType filter) {
    switch (filter) {
      case FarmerFilterType.closest:
        return "Closest";

      case FarmerFilterType.topRated:
        return "Top Rated";

      case FarmerFilterType.openNow:
        return "Open Now";

      case FarmerFilterType.organic:
        return "Organic";
    }
  }

  @override
  Widget build(BuildContext context) {
    final filters = FarmerFilterType.values;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final filter = filters[index];

          final isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              onSelected(filter);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : const Color(0xffEFEFDF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                getTitle(filter),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
