import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/cart_view_model.dart';
import '../widgets/cart_bottom_bar.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/delivery_section.dart';
import '../widgets/payment_section.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F2),

      bottomNavigationBar: CartBottomBar(
        subtotal: cartNotifier.subtotal,
        deliveryFee: cartNotifier.deliveryFee,
        total: cartNotifier.total,
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: const EdgeInsets.all(20),

              child: Row(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "My Cart",

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  Text(
                    "${cartItems.length} items",

                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            /// BODY
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  children: [
                    /// CART ITEMS
                    ...List.generate(cartItems.length, (index) {
                      final item = cartItems[index];

                      return CartItemTile(
                        item: item,

                        onIncrease: () {
                          cartNotifier.increaseQty(index);
                        },

                        onDecrease: () {
                          cartNotifier.decreaseQty(index);
                        },
                      );
                    }),

                    /// DELIVERY SECTION
                    const DeliverySection(),

                    const SizedBox(height: 16),

                    /// PAYMENT SECTION
                    const PaymentSection(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
