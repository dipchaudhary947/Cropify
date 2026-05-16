import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomerBottomScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomerBottomScreen({super.key, required this.navigationShell});

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

      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0, Icons.home, "Home", currentIndex),
              _navItem(1, Icons.assignment_outlined, "Orders", currentIndex),
              _navItem(2, Icons.shopping_cart, "Cart", currentIndex),
              _navItem(3, Icons.person, "Profile", currentIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label, int currentIndex) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: currentIndex == index ? Colors.green : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: currentIndex == index ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
