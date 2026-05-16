import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/farmer_filter_type.dart';
import '../../view_model/nearby_farmer_view_model.dart';
import '../widgets/farmer_filter_chips.dart';
import '../widgets/farmer_map_section.dart';
import '../widgets/farmer_search_field.dart';
import '../widgets/nearby_farmer_card.dart';

class NearbyFarmersScreen extends ConsumerStatefulWidget {
  const NearbyFarmersScreen({super.key});

  @override
  ConsumerState<NearbyFarmersScreen> createState() =>
      _NearbyFarmersScreenState();
}

class _NearbyFarmersScreenState extends ConsumerState<NearbyFarmersScreen> {
  FarmerFilterType selectedFilter = FarmerFilterType.closest;

  @override
  Widget build(BuildContext context) {
    final farmers = ref.watch(nearbyFarmersProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF7F8F2),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const FarmerMapSection(),
            const SizedBox(height: 18),
            const FarmerSearchField(),
            const SizedBox(height: 18),
            FarmerFilterChips(
              selectedFilter: selectedFilter,
              onSelected: (filter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                itemCount: farmers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return NearbyFarmerCard(farmer: farmers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
