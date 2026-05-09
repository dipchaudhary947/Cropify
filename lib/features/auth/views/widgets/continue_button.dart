import 'package:cropify_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../model/role_model.dart';
import '../../viewmodel/auth_view_model.dart';

class ContinueButton extends ConsumerWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(authViewModelProvider);

    final buttonText = selectedRole == RoleType.farmer
        ? "Start Selling"
        : "Start Buying";

    return SizedBox(
      width: double.infinity,
      height: 58,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),

        onPressed: () {
          if (selectedRole == RoleType.farmer) {
            context.goNamed(RouteNames.dashboard);
          } else {
            context.goNamed(RouteNames.home);
          }
        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),

            const SizedBox(width: 8),

            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
