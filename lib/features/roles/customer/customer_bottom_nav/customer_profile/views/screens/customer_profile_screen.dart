import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_profile/view_model/profile_view_model.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_profile/views/widgets/menu_tile.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_profile/views/widgets/profile_metric_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerProfileScreen extends ConsumerWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the profile provider state managed by your ViewModel
    final profile = ref.watch(profileProvider);

    // Handle null state gracefully (e.g., if logged out)
    if (profile == null) {
      return const Scaffold(
        backgroundColor: Color(0xFFFAF9F5),
        body: Center(
          child: Text(
            'Logged out or profile data unavailable.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(
        0xFFFAF9F5,
      ), // Light off-white cream background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: [
              // --- Header Section ---
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFF4CAF50),
                    child: Text(
                      profile.name.isNotEmpty ? profile.name[0] : '',
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        profile.email,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Color(0xFF4CAF50),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              profile.membership,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4CAF50),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Statistics Quick Cards Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ProfileMetricCard(
                      value: '${profile.totalOrders}',
                      label: 'Orders',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ProfileMetricCard(
                      value: '${profile.totalFavorites}',
                      label: 'Favorites',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ProfileMetricCard(
                      value: '\$${profile.amountSaved.toInt()}',
                      label: 'Saved',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // --- Navigation Options Menu Section ---
              MenuTile(
                icon: Icons.inventory_2_outlined,
                title: 'Order History',
                badgeCount: profile.totalOrders,
                onTap: () {
                  // Route to Order History page
                },
              ),
              MenuTile(
                icon: Icons.favorite_border,
                title: 'Favorites',
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.location_on_outlined,
                title: 'Saved Addresses',
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.credit_card,
                title: 'Payment Methods',
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              MenuTile(
                icon: Icons.settings_outlined,
                title: 'Settings',
                onTap: () {},
              ),

              const SizedBox(height: 12),

              // --- Logout Action Button ---
              MenuTile(
                icon: Icons.logout,
                title: 'Log out',
                isLogout: true,
                onTap: () {
                  // Execute business logic through ViewModel
                  ref.read(profileProvider.notifier).logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
