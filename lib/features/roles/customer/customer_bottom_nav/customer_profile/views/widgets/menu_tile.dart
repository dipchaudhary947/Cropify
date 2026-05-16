import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final int? badgeCount;
  final bool isLogout;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.badgeCount,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = isLogout
        ? const Color(0xFFD32F2F)
        : const Color(0xFF4CAF50);
    final tileBgColor = isLogout ? const Color(0xFFFFEBEE) : Colors.white;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: tileBgColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black12.withOpacity(0.04)),
          ),
          child: Row(
            children: [
              // Circular icon container
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isLogout
                      ? const Color(0xFFFFCDD2)
                      : const Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: themeColor, size: 22),
              ),
              const SizedBox(width: 16),
              // Menu title text
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isLogout ? themeColor : Colors.black87,
                ),
              ),
              const Spacer(),
              // Conditional badge container
              if (badgeCount != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$badgeCount',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              // Chevron indicator
              Icon(
                Icons.chevron_right,
                color: isLogout
                    ? themeColor.withOpacity(0.5)
                    : Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
