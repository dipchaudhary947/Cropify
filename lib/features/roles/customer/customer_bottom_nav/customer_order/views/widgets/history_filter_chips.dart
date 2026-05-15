import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/order_history_view_model.dart';

class HistoryFilterChips extends ConsumerWidget {
  const HistoryFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(historyFilterProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _chip(ref, "All", HistoryFilter.all, selected),
          const SizedBox(width: 8),
          _chip(ref, "Delivered", HistoryFilter.delivered, selected),
          const SizedBox(width: 8),
          _chip(ref, "Cancelled", HistoryFilter.cancelled, selected),
          const SizedBox(width: 8),
          _chip(ref, "Refunded", HistoryFilter.refunded, selected),
        ],
      ),
    );
  }

  Widget _chip(
    WidgetRef ref,
    String title,
    HistoryFilter value,
    HistoryFilter selected,
  ) {
    final isSelected = value == selected;

    return GestureDetector(
      onTap: () {
        ref.read(historyFilterProvider.notifier).state = value;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF0FA958).withOpacity(0.15)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF0FA958) : Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFF0FA958) : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
