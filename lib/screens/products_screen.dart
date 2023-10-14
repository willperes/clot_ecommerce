import 'package:clot/data/products_provider.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/products_screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = "products";

  final ProductsScreenArguments arguments;

  const ProductsScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProductsProvider>(
        builder: (context, value, child) {
          final category = value.categories
              .firstWhere((element) => element.value == arguments.category);
          final products = value.products
              .where((product) => product.category == category.value)
              .toList();

          if (products.isEmpty) {
            Navigator.of(context).pop();
            return Container();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.screenPadding,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    "${category.name} (${products.length})",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(
                    top: Constants.screenPadding,
                  ),
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisExtent: Constants.productCardHeight,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                  itemCount: products.length,
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(
                    top: Constants.screenPadding,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
