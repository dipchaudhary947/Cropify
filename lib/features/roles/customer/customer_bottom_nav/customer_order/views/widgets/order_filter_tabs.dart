/// order_filter_tabs.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// TAB ENUM
enum OrderTab { active, history }

/// PROVIDER
final orderTabProvider = StateProvider<OrderTab>((ref) => OrderTab.active);

class OrderFilterTabs extends ConsumerWidget {
  const OrderFilterTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(orderTabProvider);

    return Row(
      children: [
        /// ACTIVE TAB
        _buildTab(
          title: "Active",
          isSelected: selectedTab == OrderTab.active,

          onTap: () {
            ref.read(orderTabProvider.notifier).state = OrderTab.active;
          },
        ),

        const SizedBox(width: 10),

        /// HISTORY TAB
        _buildTab(
          title: "History",
          isSelected: selectedTab == OrderTab.history,

          onTap: () {
            ref.read(orderTabProvider.notifier).state = OrderTab.history;
          },
        ),
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0FA958) : Colors.grey.shade200,

          borderRadius: BorderRadius.circular(30),
        ),

        child: Text(
          title,

          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,

            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
