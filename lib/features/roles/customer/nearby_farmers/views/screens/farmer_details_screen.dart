import 'package:flutter/material.dart';

class FarmerDetailsScreen extends StatelessWidget {
  final String farmerName;

  const FarmerDetailsScreen({super.key, required this.farmerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(farmerName)),

      body: Center(
        child: Text(
          farmerName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
