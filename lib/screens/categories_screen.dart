import 'package:clot/data/category_list.dart';
import 'package:clot/data/products_provider.dart';
import 'package:clot/models/category.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments.dart';
import 'package:clot/screens/products_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  static const routeName = "categories";
  final list = categoryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          Constants.screenPadding,
          0,
          Constants.screenPadding,
          Constants.screenPadding,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  "Shop by Categories",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                final category =
                    Provider.of<ProductsProvider>(context).categories[index];

                return _CategoryCard(category: category);
              },
              itemCount:
                  Provider.of<ProductsProvider>(context).categories.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category});

  final Category category;

  void onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductsScreen.routeName,
      arguments: ProductsScreenArguments(category: category.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: () {
          onTap(context);
        },
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          height: 64,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    category.image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(category.name,
                      style: Theme.of(context).textTheme.displaySmall),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
