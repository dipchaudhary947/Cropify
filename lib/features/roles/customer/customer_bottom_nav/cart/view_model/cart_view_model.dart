import 'package:flutter_riverpod/legacy.dart';

import '../model/cart_item_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItemModel>>((
  ref,
) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItemModel>> {
  CartNotifier()
    : super([
        CartItemModel(
          name: "Vine Tomatoes",
          farmName: "Green Valley",
          image: "assets/images/tomatos.png",
          price: 6.40,
          quantity: 2,
        ),

        CartItemModel(
          name: "Strawberries",
          farmName: "Berry Fields",
          image: "assets/images/strawberry.png",
          price: 5.00,
          quantity: 1,
        ),
      ]);

  void increaseQty(int index) {
    state[index].quantity++;

    state = [...state];
  }

  void decreaseQty(int index) {
    if (state[index].quantity > 1) {
      state[index].quantity--;

      state = [...state];
    }
  }

  double get subtotal {
    return state.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get deliveryFee => 1.99;

  double get total => subtotal + deliveryFee;
}
