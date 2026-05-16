import 'package:cropify_app/features/roles/customer/products/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final quantityProvider = StateNotifierProvider<QuantityNotifier, int>((ref) {
  return QuantityNotifier();
});

class QuantityNotifier extends StateNotifier<int> {
  QuantityNotifier() : super(1);

  void increment() {
    state++;
  }

  void decrement() {
    if (state > 1) {
      state--;
    }
  }
}

final productProvider = Provider<List<ProductModel>>((ref) {
  return [
    ProductModel(
      name: "Fresh Strawberries",
      farmName: "Berry Fields Farm",
      image: "assets/images/strawberry.png",
      price: 5.00,
      unit: "box",
      rating: 4.9,
      distance: 1.8,
      description:
          "Hand-picked at peak ripeness this morning. Sun-ripened, bursting with sweet flavor — grown without pesticides on our family farm.",
    ),

    ProductModel(
      name: "Organic Broccoli",
      farmName: "Hilltop Farm",
      image: "assets/images/broccoli.png",
      price: 2.40,
      unit: "kg",
      rating: 4.7,
      distance: 2.5,
      description:
          "Fresh organic broccoli harvested daily. Rich in nutrients and perfect for healthy meals and salads.",
    ),

    ProductModel(
      name: "Red Apples",
      farmName: "Orchard Valley",
      image: "assets/images/apple.png",
      price: 4.10,
      unit: "kg",
      rating: 4.8,
      distance: 3.1,
      description:
          "Crisp and juicy red apples grown naturally in our orchard. Sweet flavor with a refreshing bite.",
    ),

    ProductModel(
      name: "Vine Tomatoes",
      farmName: "Green Valley",
      image: "assets/images/tomatos.png",
      price: 3.20,
      unit: "kg",
      rating: 4.9,
      distance: 1.2,
      description:
          "Locally grown vine tomatoes with rich flavor and vibrant color. Perfect for salads and cooking.",
    ),
  ];
});
