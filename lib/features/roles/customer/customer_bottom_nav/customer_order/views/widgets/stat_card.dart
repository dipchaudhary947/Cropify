import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String title;

  const StatCard({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 68,

        margin: const EdgeInsets.symmetric(horizontal: 4),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(color: Colors.grey.shade300),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              value,

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0FA958),
              ),
            ),

            const SizedBox(height: 2),

            Text(
              title,

              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
