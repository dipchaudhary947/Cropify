import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/stats_view_model.dart';
import 'stat_card.dart';

class StatsSection extends ConsumerWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);

    return Row(
      children: stats.map((stat) {
        return StatCard(value: stat.value, title: stat.title);
      }).toList(),
    );
  }
}
