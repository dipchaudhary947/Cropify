import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final paymentMethodProvider = StateProvider<String>((ref) => "Online Payment");

class PaymentSection extends ConsumerWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMethod = ref.watch(paymentMethodProvider);

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
            "PAYMENT",

            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          /// ONLINE PAYMENT
          _paymentOption(
            title: "Online Payment",
            subtitle: "Visa •••• 4589",
            icon: Icons.credit_card,
            isSelected: selectedMethod == "Online Payment",

            onTap: () {
              ref.read(paymentMethodProvider.notifier).state = "Online Payment";
            },
          ),

          const SizedBox(height: 14),

          /// CASH ON DELIVERY
          _paymentOption(
            title: "Cash on Delivery",
            subtitle: "Pay when order arrives",
            icon: Icons.payments_outlined,
            isSelected: selectedMethod == "Cash on Delivery",

            onTap: () {
              ref.read(paymentMethodProvider.notifier).state =
                  "Cash on Delivery";
            },
          ),
        ],
      ),
    );
  }

  Widget _paymentOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade50 : Colors.grey.shade50,

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,

            width: 1.4,
          ),
        ),

        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade100 : Colors.white,

                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: isSelected ? Colors.green : Colors.grey.shade700,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,

                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),

            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,

              color: isSelected ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
