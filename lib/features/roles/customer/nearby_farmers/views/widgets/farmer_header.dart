import 'package:flutter/material.dart';

import 'farmer_status_badge.dart';

class FarmerHeader extends StatelessWidget {
  final String name;
  final String status;

  const FarmerHeader({super.key, required this.name, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        FarmerStatusBadge(status: status),
      ],
    );
  }
}
