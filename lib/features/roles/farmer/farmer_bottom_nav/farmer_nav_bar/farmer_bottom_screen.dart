// bottom_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FarmerBottomScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const FarmerBottomScreen({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      body: navigationShell,

      // FARMER FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 2,
        onPressed: () => _onTap(2),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0, Icons.dashboard, "Dashboard", currentIndex),

              _navItem(1, Icons.inventory_2, "Products", currentIndex),

              const SizedBox(width: 40),

              _navItem(3, Icons.receipt_long, "Orders", currentIndex),

              _navItem(4, Icons.person, "Profile", currentIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label, int currentIndex) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: isSelected ? Colors.green : Colors.grey),

          const SizedBox(height: 2),

          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
