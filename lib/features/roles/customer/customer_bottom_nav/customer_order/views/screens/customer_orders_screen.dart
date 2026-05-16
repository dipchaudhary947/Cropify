import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/view_model/customer_order_view_model.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/view_model/order_history_view_model.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/view_model/past_order_view_model.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/widgets/active_order_card.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/widgets/history_filter_chips.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/widgets/history_order_tile.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/widgets/order_filter_tabs.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/widgets/past_order_tile.dart';
import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/views/widgets/stats_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerOrdersScreen extends ConsumerWidget {
  const CustomerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ACTIVE ORDERS
    final orders = ref.watch(orderProvider);

    /// PAST ORDERS
    final pastOrders = ref.watch(pastOrderProvider);

    /// HISTORY ORDERS
    final ordersHistory = ref.watch(orderHistoryProvider);

    /// SELECTED TAB
    final selectedTab = ref.watch(orderTabProvider);

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// HEADER
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade100,

                    child: const Icon(Icons.arrow_back),
                  ),

                  const SizedBox(width: 16),

                  Text(
                    selectedTab == OrderTab.history
                        ? "Order History"
                        : "My Orders",

                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// FILTER TABS
              const OrderFilterTabs(),

              const SizedBox(height: 20),
              if (selectedTab == OrderTab.history) ...[StatsSection()],

              const SizedBox(height: 20),
              if (selectedTab == OrderTab.history) ...[
                const HistoryFilterChips(),
                const SizedBox(height: 20),
              ],
              Expanded(
                child: selectedTab == OrderTab.active
                    /// ACTIVE TAB
                    ? ListView(
                        children: [
                          /// ACTIVE ORDER CARD
                          if (orders.isNotEmpty)
                            ActiveOrderCard(order: orders.first),

                          const SizedBox(height: 20),

                          /// PAST ORDER HEADER
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              const Text(
                                "Past Orders",

                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  ref.read(orderTabProvider.notifier).state =
                                      OrderTab.history;
                                },

                                child: const Text(
                                  "See all",

                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          /// SHOW ONLY 2 HISTORY ORDERS
                          ...pastOrders
                              .take(2)
                              .map(
                                (order) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),

                                  child: PastOrderTile(order: order),
                                ),
                              ),
                        ],
                      )
                    /// HISTORY TAB
                    : ListView.builder(
                        itemCount: ordersHistory.length,

                        itemBuilder: (context, index) {
                          final order = ordersHistory[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),

                            child: HistoryOrderTile(order: order),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
