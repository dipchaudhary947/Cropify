class CustomerOrderModel {
  final String id;
  final String productName;
  final String farmName;
  final String image;
  final double price;
  final String status;
  final String deliveryTime;

  CustomerOrderModel({
    required this.id,
    required this.productName,
    required this.farmName,
    required this.image,
    required this.price,
    required this.status,
    required this.deliveryTime,
  });
}
