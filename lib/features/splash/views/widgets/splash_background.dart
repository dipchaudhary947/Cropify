import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top left circle
        Positioned(
          top: -80,
          left: -80,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Bottom right circle
        Positioned(
          bottom: -100,
          right: -100,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Small dot
        Positioned(
          top: 200,
          right: 40,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
