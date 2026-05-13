import 'package:flutter/material.dart';

import '../../model/nearby_farmer_model.dart';

class NearbyFarmerGridCard extends StatelessWidget {
  final NearbyFarmerModel farmer;

  const NearbyFarmerGridCard({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.green,
            child: Text(
              farmer.imageLetter,

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            farmer.name,
            textAlign: TextAlign.center,

            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(farmer.distance, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
