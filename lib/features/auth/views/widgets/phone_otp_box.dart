import 'package:cropify_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PhoneOtpBox extends StatelessWidget {
  const PhoneOtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: AppColors.border),
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightBackground,
            child: Icon(Icons.call, color: Colors.grey.shade700),
          ),

          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "PHONE NUMBER",
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.grey,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: 4),

              Text(
                "+66 987654321",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
