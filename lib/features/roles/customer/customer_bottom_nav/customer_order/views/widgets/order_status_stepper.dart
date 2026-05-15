import 'package:flutter/material.dart';

class OrderStatusStepper extends StatelessWidget {
  const OrderStatusStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        _buildStep(
          icon: Icons.inventory_2_outlined,
          title: "Packed",
          active: true,
        ),

        Expanded(child: Divider(color: Colors.green, thickness: 2)),

        _buildStep(
          icon: Icons.local_shipping_outlined,
          title: "Shipped",
          active: true,
        ),

        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 2)),

        _buildStep(
          icon: Icons.check_circle_outline,
          title: "Delivered",
          active: false,
        ),
      ],
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String title,
    required bool active,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: active ? Colors.green : Colors.grey.shade200,

          child: Icon(
            icon,
            color: active ? Colors.white : Colors.grey,
            size: 18,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: active ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}
