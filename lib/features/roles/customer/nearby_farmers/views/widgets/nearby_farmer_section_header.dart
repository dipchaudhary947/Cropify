import 'package:flutter/material.dart';

class NearbyFarmerSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const NearbyFarmerSectionHeader({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,

          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        GestureDetector(
          onTap: onSeeAll,

          child: const Text(
            "Map",

            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
