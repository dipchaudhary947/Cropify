import 'package:flutter/material.dart';

import '../../model/cart_item_model.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xffF5F5F0),
              borderRadius: BorderRadius.circular(18),
            ),

            child: Image.asset(item.image),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item.name,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  item.farmName,

                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),

                const SizedBox(height: 6),

                Text(
                  "\$${item.price.toStringAsFixed(2)}",

                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),

            decoration: BoxDecoration(
              color: const Color(0xffF5F5F0),
              borderRadius: BorderRadius.circular(30),
            ),

            child: Row(
              children: [
                GestureDetector(
                  onTap: onDecrease,

                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,

                    child: Icon(Icons.remove, size: 16),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  child: Text(
                    item.quantity.toString(),

                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                GestureDetector(
                  onTap: onIncrease,

                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.green,

                    child: Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
