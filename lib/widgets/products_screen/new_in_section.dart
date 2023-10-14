import 'package:clot/data/new_in_list.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/products_screen/product_card.dart';
import 'package:flutter/material.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  static final products = newInList;

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
