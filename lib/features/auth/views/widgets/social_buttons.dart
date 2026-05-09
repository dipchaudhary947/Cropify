import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _socialButton(
            title: "Google",
            icon: Icons.g_mobiledata,
            onTap: () {},
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: _socialButton(
            title: "Facebook",
            icon: Icons.facebook,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _socialButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 58,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(40),

          border: Border.all(color: AppColors.border),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 28),

            const SizedBox(width: 8),

            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
