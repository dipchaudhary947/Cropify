class CartItemModel {
  final String name;
  final String farmName;
  final String image;
  final double price;
  int quantity;

  CartItemModel({
    required this.name,
    required this.farmName,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
