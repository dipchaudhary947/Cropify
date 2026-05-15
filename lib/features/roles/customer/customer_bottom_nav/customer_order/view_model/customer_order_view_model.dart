import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/model/customer_order_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final orderProvider =
    StateNotifierProvider<CustomerOrderViewModel, List<CustomerOrderModel>>(
      (ref) => CustomerOrderViewModel(),
    );

class CustomerOrderViewModel extends StateNotifier<List<CustomerOrderModel>> {
  CustomerOrderViewModel() : super(_dummyOrders);

  static final List<CustomerOrderModel> _dummyOrders = [
    CustomerOrderModel(
      id: "1",
      productName: "Vine Tomatoes",
      farmName: "Green Valley Farm",
      image: "assets/images/tomatos.png",
      price: 14.20,
      status: "Shipped",
      deliveryTime: "Today, 4:30 PM",
    ),
  ];
}
