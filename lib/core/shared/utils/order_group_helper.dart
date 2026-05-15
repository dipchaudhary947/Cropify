import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/model/past_order_model.dart';

Map<String, List<PastOrderModel>> groupOrders(List<PastOrderModel> orders) {
  final Map<String, List<PastOrderModel>> grouped = {};

  for (final order in orders) {
    /// GROUP TITLE
    final key = order.date.contains("May") ? "THIS MONTH" : "EARLIER";

    grouped.putIfAbsent(key, () => []);

    grouped[key]!.add(order);
  }

  return grouped;
}
