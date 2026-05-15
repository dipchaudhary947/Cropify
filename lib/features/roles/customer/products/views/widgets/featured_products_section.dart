import 'package:cropify_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../view_model/product_view_model.dart';
import 'product_card.dart';
import 'section_header.dart';

class FeaturedProductsSection extends ConsumerWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    final featuredProducts = products.take(3).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SectionHeader(
            title: "Featured",
            onSeeAll: () {
              context.pushNamed(RouteNames.allProducts);
            },
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 238,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: featuredProducts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ProductCard(product: featuredProducts[index]);
            },
          ),
        ),
      ],
    );
  }
}
