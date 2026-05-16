import 'package:flutter/material.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "DELIVERY TO",

            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.green.shade100,

                child: const Icon(Icons.location_on, color: Colors.green),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),

                    SizedBox(height: 4),

                    Text(
                      "142 Pine St, Brooklyn NY\n11201",

                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),

              TextButton(onPressed: () {}, child: const Text("Change")),
            ],
          ),
        ],
      ),
    );
  }
}
