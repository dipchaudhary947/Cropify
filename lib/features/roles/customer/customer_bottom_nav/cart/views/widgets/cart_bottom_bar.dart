import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;

  const CartBottomBar({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          _priceRow(
            title: "Subtotal",
            value: "\$${subtotal.toStringAsFixed(2)}",
          ),

          const SizedBox(height: 10),

          _priceRow(
            title: "Delivery",
            value: "\$${deliveryFee.toStringAsFixed(2)}",
          ),

          const Divider(height: 30),

          _priceRow(
            title: "Total",
            value: "\$${total.toStringAsFixed(2)}",
            isTotal: true,
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 56,

            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: Text(
                "Place Order - \$${total.toStringAsFixed(2)}",

                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow({
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,

          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            fontSize: isTotal ? 18 : 15,
          ),
        ),

        Text(
          value,

          style: TextStyle(
            color: isTotal ? Colors.green : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: isTotal ? 24 : 15,
          ),
        ),
      ],
    );
  }
}
