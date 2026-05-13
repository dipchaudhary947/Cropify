import 'package:flutter/material.dart';

import '../../model/nearby_farmer_model.dart';
import 'farmer_header.dart';
import 'farmer_info_row.dart';
import 'farmer_tags.dart';
import 'visit_button.dart';

class NearbyFarmerCard extends StatelessWidget {
  final NearbyFarmerModel farmer;

  const NearbyFarmerCard({super.key, required this.farmer});

  Color getAvatarColor() {
    switch (farmer.imageLetter) {
      case "G":
        return Colors.green;

      case "S":
        return Colors.brown;

      case "B":
        return Colors.red;

      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,

            decoration: BoxDecoration(
              color: getAvatarColor(),
              shape: BoxShape.circle,
            ),

            alignment: Alignment.center,

            child: Text(
              farmer.imageLetter,

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmerHeader(name: farmer.name, status: farmer.status),

                const SizedBox(height: 4),

                FarmerInfoRow(
                  distance: farmer.distance,
                  rating: farmer.rating,
                  reviews: farmer.reviews,
                ),

                const SizedBox(height: 8),

                FarmerTags(tags: farmer.tags),
              ],
            ),
          ),

          const SizedBox(width: 10),

          VisitButton(onTap: () {}),
        ],
      ),
    );
  }
}
