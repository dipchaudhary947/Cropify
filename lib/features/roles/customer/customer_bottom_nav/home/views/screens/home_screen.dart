import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/views/widgets/categories_section.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/views/widgets/deal_banner.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/views/widgets/home_header.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/home/views/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20), child: HomeHeader()),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchField(
                controller: searchController,
                hintText: "Search vegetables, fruits...",
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DealBanner(),
            ),

            const SizedBox(height: 24),

            CategoriesSection(),
          ],
        ),
      ),
    );
  }
}
