import 'package:clot/data/top_selling_list.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/products_screen/product_card.dart';
import 'package:flutter/material.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  static final products = topSellingList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: SizedBox(
        height: Constants.productCardHeight,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.screenPadding,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(product: product);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 12,
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}
