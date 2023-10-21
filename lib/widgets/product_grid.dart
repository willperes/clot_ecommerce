import 'package:clot/models/product_model.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/home_screen_content/product_card.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.products});

  final List<ProductModel> products;

  @override
  SliverGrid build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisExtent: Constants.productCardHeight,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
      itemCount: products.length,
    );
  }
}
