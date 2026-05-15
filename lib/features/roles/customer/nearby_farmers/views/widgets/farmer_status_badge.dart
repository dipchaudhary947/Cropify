import 'package:flutter/material.dart';

class FarmerStatusBadge extends StatelessWidget {
  final String status;

  const FarmerStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final normalizedStatus = status.toUpperCase();

    final isOpen = normalizedStatus == "OPEN";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),

      decoration: BoxDecoration(
        color: isOpen ? Colors.green.shade100 : Colors.red.shade100,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        isOpen ? "OPEN" : "CLOSED",

        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isOpen ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
