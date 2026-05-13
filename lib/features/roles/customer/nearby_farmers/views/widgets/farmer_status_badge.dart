import 'package:flutter/material.dart';

class FarmerStatusBadge extends StatelessWidget {
  final String status;

  const FarmerStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isOpen = status == "OPEN";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),

      decoration: BoxDecoration(
        color: isOpen ? Colors.green.shade100 : Colors.red.shade100,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        status,

        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isOpen ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
