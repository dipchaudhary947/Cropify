import 'package:cropify_app/core/constants/app_colors.dart';
import 'package:cropify_app/features/auth/views/widgets/continue_button.dart';
import 'package:cropify_app/features/auth/views/widgets/logo_section.dart';
import 'package:cropify_app/features/auth/views/widgets/role_selector.dart';
import 'package:cropify_app/features/auth/views/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const LogoSection(),

              const SizedBox(height: 25),

              const Text(
                "Create your",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),

              const Text(
                "Cropify Account",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Join Cropify and start buying or selling fresh products",
                style: TextStyle(color: AppColors.grey, fontSize: 14),
              ),

              const SizedBox(height: 30),

              // FULL NAME
              _buildInputField(
                title: "FULL NAME",
                hint: "Dip Chaudhary",
                icon: Icons.person,
              ),

              const SizedBox(height: 18),

              // PHONE NUMBER
              _buildInputField(
                title: "PHONE NUMBER",
                hint: "+66 987654321",
                icon: Icons.call,
              ),

              const SizedBox(height: 28),

              const Text(
                "I AM A",
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 16),

              const RoleSelector(),

              const SizedBox(height: 30),

              const ContinueButton(),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade400)),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("OR"),
                  ),

                  Expanded(child: Divider(color: Colors.grey.shade400)),
                ],
              ),

              const SizedBox(height: 24),

              const SocialButtons(),

              const SizedBox(height: 30),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text("Already have an account? "),

                    GestureDetector(
                      onTap: () {},

                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildInputField({
    required String title,
    required String hint,
    required IconData icon,
  }) {
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
            radius: 24,
            backgroundColor: AppColors.lightBackground,

            child: Icon(icon, color: Colors.grey.shade700),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.grey,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
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
