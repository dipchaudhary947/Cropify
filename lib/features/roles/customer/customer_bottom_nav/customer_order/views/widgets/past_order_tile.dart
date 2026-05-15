import 'package:flutter/material.dart';

import '../../model/past_order_model.dart';

class PastOrderTile extends StatelessWidget {
  final PastOrderModel order;

  const PastOrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          /// IMAGE
          Container(
            width: 60,
            height: 60,

            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),

            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(order.image),
            ),
          ),

          const SizedBox(width: 12),

          /// PRODUCT INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  order.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "${order.farmName} · ${order.date}",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),

          /// PRICE + STATUS
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                order.price,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 6),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  order.status,
                  style: const TextStyle(color: Colors.green, fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
