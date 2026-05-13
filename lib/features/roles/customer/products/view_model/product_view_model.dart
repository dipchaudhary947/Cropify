import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/product_model.dart';

final productProvider = Provider<List<ProductModel>>((ref) {
  return [
    ProductModel(
      name: "Vine Tomatoes",
      farmName: "Green Valley",
      image: "assets/images/tomatos.png",
      price: 3.20,
      unit: "kg",
      rating: 4.9,
    ),
    ProductModel(
      name: "Strawberries",
      farmName: "Berry Fields",
      image: "assets/images/strawberry.png",
      price: 5.00,
      unit: "box",
      rating: 4.9,
    ),
    ProductModel(
      name: "Broccoli",
      farmName: "Hilltop Farm",
      image: "assets/images/broccoli.png",
      price: 2.40,
      unit: "kg",
      rating: 4.7,
    ),
    ProductModel(
      name: "Red Apples",
      farmName: "Orchard Co.",
      image: "assets/images/apple.png",
      price: 4.10,
      unit: "kg",
      rating: 4.8,
    ),
  ];
});
