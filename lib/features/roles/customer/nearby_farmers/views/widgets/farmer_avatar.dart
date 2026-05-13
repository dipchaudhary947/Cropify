import 'package:flutter/material.dart';

class FarmerAvatar extends StatelessWidget {
  final String letter;
  final Color color;

  const FarmerAvatar({super.key, required this.letter, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,

      decoration: BoxDecoration(color: color, shape: BoxShape.circle),

      alignment: Alignment.center,

      child: Text(
        letter,

        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
