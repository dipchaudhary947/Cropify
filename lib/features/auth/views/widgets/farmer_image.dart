import 'package:flutter/material.dart';

class FarmerImage extends StatelessWidget {
  const FarmerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/farmer.png",
      height: 250,
      fit: BoxFit.contain,
    );
  }
}
