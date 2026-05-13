import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/nearby_farmer_model.dart';

final nearbyFarmersProvider = Provider<List<NearbyFarmerModel>>((ref) {
  return [
    NearbyFarmerModel(
      name: "Green Valley Farm",
      imageLetter: "G",
      distance: "1.2 km",
      rating: 4.9,
      reviews: 284,
      status: "OPEN",
      tags: ["Vegetables", "Organic"],
    ),

    NearbyFarmerModel(
      name: "Sunrise Dairy",
      imageLetter: "S",
      distance: "2.4 km",
      rating: 4.8,
      reviews: 192,
      status: "OPEN",
      tags: ["Dairy", "Eggs"],
    ),

    NearbyFarmerModel(
      name: "Berry Fields",
      imageLetter: "B",
      distance: "3.1 km",
      rating: 4.9,
      reviews: 156,
      status: "OPEN",
      tags: ["Fruits"],
    ),
  ];
});
