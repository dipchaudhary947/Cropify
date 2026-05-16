import 'package:flutter/material.dart';

class FarmerSearchField extends StatelessWidget {
  const FarmerSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search farms...",

        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),

        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),

        filled: true,
        fillColor: const Color(0xffEFEFDF),

        contentPadding: const EdgeInsets.symmetric(vertical: 18),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
