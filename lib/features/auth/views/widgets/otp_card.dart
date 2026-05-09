import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class OTPCard extends StatelessWidget {
  const OTPCard({super.key});

  @override
  Widget build(BuildContext context) {
    final otp = ["4", "8", "2", "1"];

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "ENTER 4-DIGIT OTP",
            style: TextStyle(
              fontSize: 10,
              color: AppColors.grey,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: otp.map((e) {
              return Container(
                width: 55,
                height: 55,

                alignment: Alignment.center,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGreen,

                  border: Border.all(color: AppColors.primaryGreen),
                ),

                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          RichText(
            text: const TextSpan(
              text: "Resend code in ",
              style: TextStyle(color: AppColors.grey, fontSize: 12),

              children: [
                TextSpan(
                  text: "00:24",
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
