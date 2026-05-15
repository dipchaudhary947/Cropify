import 'package:flutter_riverpod/legacy.dart';

import '../model/past_order_model.dart';

/// PROVIDER
final pastOrderProvider =
    StateNotifierProvider<PastOrderViewModel, List<PastOrderModel>>(
      (ref) => PastOrderViewModel(),
    );

class PastOrderViewModel extends StateNotifier<List<PastOrderModel>> {
  PastOrderViewModel() : super(_dummyOrders);

  static final List<PastOrderModel> _dummyOrders = [
    PastOrderModel(
      image: "assets/images/strawberry.png",
      productName: "Strawberries Box",
      farmName: "Berry Fields",
      date: "Apr 28",
      price: "\$5.00",
      status: "Delivered",
    ),

    PastOrderModel(
      image: "assets/images/broccoli.png",
      productName: "Fresh Broccoli",
      farmName: "Green Farm",
      date: "Apr 24",
      price: "\$8.40",
      status: "Delivered",
    ),
  ];
}
