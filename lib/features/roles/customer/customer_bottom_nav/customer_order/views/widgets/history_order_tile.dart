/// history_order_tile.dart

import 'package:flutter/material.dart';
import '../../model/order_history_model.dart';

class HistoryOrderTile extends StatelessWidget {
  final OrderHistoryModel order;

  const HistoryOrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final isCancelled = order.status == OrderStatus.cancelled;
    final isRated = order.status == OrderStatus.delivered;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        children: [
          /// TOP SECTION
          Row(
            children: [
              /// IMAGE
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(order.image, fit: BoxFit.contain),
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "${order.farmName} · ${order.orderId} · ${order.date}",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 8),

                    _statusBadge(),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              /// PRICE + ARROW
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${order.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Color(0xFF0FA958),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Icon(Icons.chevron_right, color: Colors.grey.shade500),
                ],
              ),
            ],
          ),

          /// CANCELLED UI
          if (isCancelled) ...[
            const SizedBox(height: 14),

            Divider(color: Colors.grey.shade300, height: 1),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDECEC),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},

                icon: const Icon(
                  Icons.close_rounded,
                  size: 18,
                  color: Colors.red,
                ),

                label: const Text(
                  "Cancelled",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ]
          /// NORMAL UI (DELIVERED / REFUNDED)
          else ...[
            const SizedBox(height: 14),

            Divider(color: Colors.grey.shade300, height: 1),

            const SizedBox(height: 14),

            Row(
              children: [
                /// REORDER
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4F3EA),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},

                      icon: Icon(
                        Icons.refresh,
                        size: 18,
                        color: Colors.grey.shade800,
                      ),

                      label: Text(
                        "Reorder",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// RATE BUTTON
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: isRated
                            ? const Color(0xFFF4F3EA)
                            : const Color(0xFF071B0C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},

                      icon: Icon(
                        Icons.star,
                        size: 18,
                        color: isRated ? const Color(0xFFE0B53B) : Colors.white,
                      ),

                      label: Text(
                        isRated ? "Rated" : "Rate order",
                        style: TextStyle(
                          color: isRated ? Colors.grey.shade900 : Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _statusBadge() {
    Color bgColor;
    Color textColor;
    String text;

    switch (order.status) {
      case OrderStatus.delivered:
        bgColor = const Color(0xFFDDF5E5);
        textColor = const Color(0xFF16A34A);
        text = "Delivered";
        break;

      case OrderStatus.cancelled:
        bgColor = const Color(0xFFFDE2E2);
        textColor = Colors.red;
        text = "Cancelled";
        break;

      case OrderStatus.refunded:
        bgColor = const Color(0xFFFFF1D6);
        textColor = Colors.orange;
        text = "Refunded";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
