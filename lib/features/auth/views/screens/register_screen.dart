import 'package:cropify_app/core/constants/app_colors.dart';
import 'package:cropify_app/features/auth/views/widgets/logo_section.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(children: [LogoSection()]),
        ),
      ),
    );
  }
}
