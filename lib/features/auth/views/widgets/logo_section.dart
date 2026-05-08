import 'package:cropify_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.eco, color: Colors.white, size: 20),
        ),
        SizedBox(width: 10),
        Text(
          "Cropify",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
