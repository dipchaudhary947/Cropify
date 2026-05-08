import 'package:cropify_app/core/constants/app_colors.dart';
import 'package:cropify_app/core/constants/app_strings.dart';
import 'package:cropify_app/features/auth/viewmodel/auth_view_model.dart';
import 'package:cropify_app/features/auth/views/widgets/auth_button.dart';
import 'package:cropify_app/features/auth/views/widgets/farmer_image.dart';
import 'package:cropify_app/features/auth/views/widgets/logo_section.dart';
import 'package:cropify_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authVM = ref.read(authViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              LogoSection(),
              Spacer(),
              FarmerImage(),
              Text(
                AppStrings.title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              Text(
                AppStrings.title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
              SizedBox(height: 14),
              Text(
                AppStrings.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              AuthButton(
                text: AppStrings.signUp,
                backgroundColor: AppColors.primaryGreen,
                textColor: Colors.white,
                onTap: () {
                  // authVM.signUp,
                  context.goNamed(RouteNames.regsiter);
                },
              ),
              SizedBox(height: 16),
              AuthButton(
                text: AppStrings.login,
                backgroundColor: AppColors.grayButton,
                textColor: Colors.black,
                border: BorderSide(color: Colors.grey.shade300),
                onTap: () {
                  // authVM.login,
                  context.goNamed(RouteNames.home);
                },
              ),
              SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                  children: [
                    TextSpan(text: "By continuing you agree to our "),
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
