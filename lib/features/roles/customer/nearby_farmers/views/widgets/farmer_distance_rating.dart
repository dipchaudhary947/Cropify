import 'package:flutter/material.dart';

class FarmerDistanceRating extends StatelessWidget {
  final String distance;
  final double rating;

  const FarmerDistanceRating({
    super.key,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 14),

        Text(distance),

        const SizedBox(width: 8),

        const Icon(Icons.star, color: Colors.orange, size: 14),

        Text(rating.toString()),
      ],
    );
  }
}
