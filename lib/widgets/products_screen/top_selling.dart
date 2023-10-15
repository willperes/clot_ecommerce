import 'package:clot/data/products_provider.dart';
import 'package:clot/data/top_selling_list.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/products_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<ProductsProvider>(
          builder: (context, value, child) {
            final list = value.topSellingProducts.sublist(
                0,
                value.topSellingProducts.length < 10
                    ? value.topSellingProducts.length
                    : 10);

            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.screenPadding,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = list[index];

                return ProductCard(product: product);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: list.length,
            );
          },
        ),
      ),
    );
  }
}
