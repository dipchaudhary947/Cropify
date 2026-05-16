import 'package:flutter/material.dart';

import '../../../products/model/product_model.dart';

class ChatAppBar extends StatelessWidget {
  final ProductModel product;

  const ChatAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      /// LEFT SPACE
      leadingWidth: 56,

      leading: Padding(
        padding: const EdgeInsets.only(left: 8),

        child: CircleAvatar(
          backgroundColor: const Color(0xffECE9DC),

          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 18, color: Colors.black),

            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      titleSpacing: 0,

      /// TITLE
      title: SizedBox(
        width: 230,

        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            /// FARM IMAGE
            CircleAvatar(
              radius: 22,

              backgroundColor: const Color(0xff43A047),

              backgroundImage: product.image.isNotEmpty
                  ? NetworkImage(product.image)
                  : null,

              child: product.image.isEmpty
                  ? Text(
                      product.farmName[0],

                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 10),

            /// FARM DETAILS
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// FARM NAME
                  Text(
                    product.farmName,

                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 3),

                  /// STATUS ROW
                  Row(
                    children: [
                      /// ONLINE DOT
                      Container(
                        width: 6,
                        height: 6,

                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        "Online",

                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 11,
                        ),
                      ),

                      const SizedBox(width: 8),

                      /// RATING
                      Icon(
                        Icons.star_rounded,
                        size: 13,
                        color: Colors.amber.shade700,
                      ),

                      const SizedBox(width: 2),

                      Text(
                        product.rating.toString(),

                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(width: 8),

                      /// DISTANCE
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.red.shade400,
                      ),

                      const SizedBox(width: 2),

                      Text(
                        "1.2 km",

                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// RIGHT ACTIONS
      actions: [
        SizedBox(
          width: 56,

          child: Padding(
            padding: const EdgeInsets.only(right: 8),

            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xffD9F2DD),

              child: IconButton(
                icon: const Icon(
                  Icons.call,
                  size: 18,
                  color: Color(0xff43A047),
                ),

                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
