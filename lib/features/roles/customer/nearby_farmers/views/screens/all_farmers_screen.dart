import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/farmer_filter_type.dart';
import '../../view_model/nearby_farmer_view_model.dart';
import '../widgets/farmer_filter_chips.dart';
import '../widgets/farmer_map_section.dart';
import '../widgets/farmer_search_field.dart';
import '../widgets/nearby_farmer_card.dart';

class AllFarmersScreen extends ConsumerStatefulWidget {
  const AllFarmersScreen({super.key});

  @override
  ConsumerState<AllFarmersScreen> createState() => _AllFarmersScreenState();
}

class _AllFarmersScreenState extends ConsumerState<AllFarmersScreen> {
  FarmerFilterType selectedFilter = FarmerFilterType.closest;

  @override
  Widget build(BuildContext context) {
    final farmers = ref.watch(nearbyFarmersProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF7F8F2),

      appBar: AppBar(
        backgroundColor: const Color(0xffF7F8F2),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Nearby Farmers",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        leading: Padding(
          padding: const EdgeInsets.all(8),

          child: CircleAvatar(
            backgroundColor: Colors.white,

            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },

              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          /// MAP
          Padding(
            padding: const EdgeInsets.all(20),
            child: const FarmerMapSection(),
          ),

          /// SEARCH
          Padding(
            padding: const EdgeInsets.all(20),
            child: const FarmerSearchField(),
          ),

          const SizedBox(height: 18),

          /// FILTERS
          FarmerFilterChips(
            selectedFilter: selectedFilter,

            onSelected: (filter) {
              setState(() {
                selectedFilter = filter;
              });
            },
          ),

          const SizedBox(height: 18),

          /// FARMERS LIST
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
    );
  }
}
