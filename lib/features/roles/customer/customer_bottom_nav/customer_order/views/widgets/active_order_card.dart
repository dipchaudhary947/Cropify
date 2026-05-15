import 'package:cropify_app/features/roles/customer/customer_bottom_nav/customer_order/model/customer_order_model.dart';
import 'package:flutter/material.dart';

import 'action_buttons.dart';
import 'order_status_stepper.dart';

class ActiveOrderCard extends StatelessWidget {
  final CustomerOrderModel order;

  const ActiveOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        children: [
          /// PRODUCT INFO
          Row(
            children: [
              Container(
                width: 70,
                height: 70,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade100,
                ),

                child: Image.asset(order.image),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "#FH-2841",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),

                    Text(
                      order.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Text(
                      order.farmName,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

              Text(
                "\$${order.price}",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// STATUS STEPPER
          const OrderStatusStepper(),

          const SizedBox(height: 10),

          /// DELIVERY INFO
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                const Icon(Icons.access_time, color: Colors.green, size: 16),

                const SizedBox(width: 10),

                Text(
                  "Arriving ${order.deliveryTime}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// BUTTONS
          const ActionButtons(),
        ],
      ),
    );
  }
}
