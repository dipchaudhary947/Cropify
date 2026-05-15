import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../model/order_history_model.dart';

/// FILTER ENUM
enum HistoryFilter { all, delivered, cancelled, refunded }

/// FILTER PROVIDER
final historyFilterProvider = StateProvider<HistoryFilter>(
  (ref) => HistoryFilter.all,
);

/// ORDER PROVIDER
final orderHistoryProvider = Provider<List<OrderHistoryModel>>((ref) {
  final filter = ref.watch(historyFilterProvider);

  final orders = _dummyOrders;

  if (filter == HistoryFilter.all) {
    return orders;
  }

  return orders.where((order) {
    switch (filter) {
      case HistoryFilter.delivered:
        return order.status == OrderStatus.delivered;

      case HistoryFilter.cancelled:
        return order.status == OrderStatus.cancelled;

      case HistoryFilter.refunded:
        return order.status == OrderStatus.refunded;

      default:
        return true;
    }
  }).toList();
});

final List<OrderHistoryModel> _dummyOrders = [
  OrderHistoryModel(
    image: "assets/images/tomatos.png",
    productName: "Vine Tomatoes + 2...",
    farmName: "Green Valley Farm",
    orderId: "#FH-2841",
    date: "May 02",
    price: 14.20,
    status: OrderStatus.delivered,
  ),

  OrderHistoryModel(
    image: "assets/images/strawberry.png",
    productName: "Strawberries Box",
    farmName: "Berry Fields",
    orderId: "#FH-2828",
    date: "Apr 28",
    price: 5.00,
    status: OrderStatus.delivered,
  ),

  OrderHistoryModel(
    image: "assets/images/broccoli.png",
    productName: "Broccoli + Greens",
    farmName: "Hilltop Farm",
    orderId: "#FH-2740",
    date: "Apr 06",
    price: 11.80,
    status: OrderStatus.refunded,
  ),
];
