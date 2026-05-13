import 'package:flutter/material.dart';

class FarmerInfoRow extends StatelessWidget {
  final String distance;
  final double rating;
  final int reviews;

  const FarmerInfoRow({
    super.key,
    required this.distance,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade600),

        Text(
          distance,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),

        const SizedBox(width: 8),

        const Icon(Icons.star, size: 14, color: Colors.orange),

        Text(
          "$rating ($reviews)",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
