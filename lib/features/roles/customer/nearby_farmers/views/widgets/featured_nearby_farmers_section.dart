import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/nearby_farmer_view_model.dart';
import '../screens/all_farmers_screen.dart';
import 'nearby_farmer_card.dart';
import 'nearby_farmer_section_header.dart';

class FeaturedNearbyFarmersSection extends ConsumerWidget {
  const FeaturedNearbyFarmersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmers = ref.watch(nearbyFarmersProvider);

    final featured = farmers.take(2).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: NearbyFarmerSectionHeader(
            title: "Nearby Farmers",
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllFarmersScreen()),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        Column(
          children: featured.map((farmer) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: NearbyFarmerCard(farmer: farmer),
            );
          }).toList(),
        ),
      ],
    );
  }
}
