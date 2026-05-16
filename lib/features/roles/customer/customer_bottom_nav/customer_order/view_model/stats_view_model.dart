import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/stats_model.dart';

final statsProvider = Provider<List<StatsModel>>((ref) {
  return [
    StatsModel(value: "47", title: "Total"),
    StatsModel(value: "\$612", title: "Spent"),
    StatsModel(value: "12", title: "Farmers"),
  ];
});
