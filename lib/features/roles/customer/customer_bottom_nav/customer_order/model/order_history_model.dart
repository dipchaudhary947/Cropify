enum OrderStatus { delivered, cancelled, refunded }

class OrderHistoryModel {
  final String image;
  final String productName;
  final String farmName;
  final String orderId;
  final String date;
  final double price;
  final OrderStatus status;

  OrderHistoryModel({
    required this.image,
    required this.productName,
    required this.farmName,
    required this.orderId,
    required this.date,
    required this.price,
    required this.status,
  });
}
