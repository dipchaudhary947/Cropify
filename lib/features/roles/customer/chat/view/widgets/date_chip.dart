import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  const DateChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),

      child: Text(
        "Today",
        style: TextStyle(color: Colors.grey.shade700, fontSize: 11),
      ),
    );
  }
}
