import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';

import '../../model/role_model.dart';
import '../../viewmodel/auth_view_model.dart';

class RoleSelector extends ConsumerWidget {
  const RoleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(authViewModelProvider);

    return Row(
      children: roles.map((role) {
        final isSelected = selectedRole == role.role;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              ref.read(authViewModelProvider.notifier).selectRole(role.role);
            },

            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: isSelected ? AppColors.lightGreen : Colors.white,

                borderRadius: BorderRadius.circular(22),

                border: Border.all(
                  color: isSelected ? AppColors.primaryGreen : AppColors.border,

                  width: 1.5,
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Icon(role.icon, color: AppColors.primaryGreen, size: 28),

                  const SizedBox(height: 16),

                  Text(
                    role.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    role.subtitle,
                    style: const TextStyle(fontSize: 10, color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
