import 'package:flutter/material.dart';

class FarmerMapSection extends StatelessWidget {
  const FarmerMapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,

      decoration: BoxDecoration(
        color: const Color(0xffE8F3E5), // The exact light mint green
        borderRadius: BorderRadius.circular(32),
      ),

      child: Stack(
        children: [
          Positioned(top: 35, left: 40, child: buildMarker(Colors.green)),

          Positioned(top: 95, left: 75, child: buildMarker(Colors.orange)),

          Positioned(top: 60, right: 50, child: buildMarker(Colors.brown)),

          Positioned(
            bottom: 18,
            right: 18,
            child: Container(
              height: 46,
              width: 46,

              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),

              child: const Icon(Icons.navigation_outlined, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMarker(Color color) {
    return Container(
      height: 28,
      width: 28,

      decoration: BoxDecoration(color: color, shape: BoxShape.circle),

      child: const Icon(Icons.location_on, color: Colors.white, size: 16),
    );
  }
}
