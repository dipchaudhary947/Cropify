import 'package:flutter/material.dart';

import '../../model/nearby_farmer_model.dart';
import 'nearby_farmer_card.dart';

class NearbyFarmersList extends StatelessWidget {
  final List<NearbyFarmerModel> farmers;

  const NearbyFarmersList({super.key, required this.farmers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: farmers.length,

      separatorBuilder: (_, __) => const SizedBox(height: 14),

      itemBuilder: (context, index) {
        return NearbyFarmerCard(farmer: farmers[index]);
      },
    );
  }
}
