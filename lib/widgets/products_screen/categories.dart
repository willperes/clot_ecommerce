import 'package:clot/data/products_provider.dart';
import 'package:clot/models/category.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments.dart';
import 'package:clot/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Consumer<ProductsProvider>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: value.categories.length >= 5
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceEvenly,
            children: value.categories
                .sublist(0,
                    value.categories.length >= 5 ? 5 : value.categories.length)
                .map((category) {
              return _CategoryItem(category: category);
            }).toList(),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.category});

  final Category category;

  void onTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      ProductsScreen.routeName,
      arguments: ProductsScreenArguments(category: category.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: SizedBox(
        height: 80,
        width: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                category.image,
                fit: BoxFit.cover,
                height: 56,
                width: 56,
              ),
            ),
            const Spacer(),
            Text(
              category.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
