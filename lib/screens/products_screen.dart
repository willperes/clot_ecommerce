import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/products_screen/categories.dart';
import 'package:clot/widgets/products_screen/new_in_section.dart';
import 'package:clot/widgets/products_screen/section_title.dart';
import 'package:clot/widgets/products_screen/top_selling.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const routeName = "products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.screenPadding,
              ),
              child: Column(
                children: [
                  _Header(),
                  SectionTitle(text: "Categories"),
                  CategoriesSection(),
                  SizedBox(
                    height: Constants.screenPadding,
                  ),
                  SectionTitle(text: "Top Selling"),
                ],
              ),
            ),
            const TopSellingSection(),
            const SizedBox(
              height: Constants.screenPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.screenPadding,
              ),
              child: SectionTitle(
                text: "New In",
                textColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const NewInSection(),
            const SizedBox(
              height: Constants.screenPadding,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 12,
                    ),
                    child: Icon(
                      Icons.search,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Search",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
