import 'package:clot/data/products_provider.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments_model.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = "products";

  final ProductsScreenArgumentsModel arguments;

  const ProductsScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, value, child) {
          if (arguments.products.isEmpty) {
            Navigator.of(context).pop();
            return const SizedBox.shrink();
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.screenPadding,
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    "${arguments.title} (${arguments.products.length})",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: Constants.screenPadding,
                  ),
                ),
                ProductGrid(
                  products: arguments.products,
                ),
                SliverPadding(
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
