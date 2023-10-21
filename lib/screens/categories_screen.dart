import 'package:clot/data/products_provider.dart';
import 'package:clot/models/category_model.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments_model.dart';
import 'package:clot/screens/products_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/search_bar.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const routeName = "categories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
        title: const SearchBarPlaceholder(showPadding: true),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
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

  final CategoryModel category;

  void onTap(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context, listen: false)
        .getByCategoryID(category.id);
    Navigator.pushNamed(
      context,
      ProductsScreen.routeName,
      arguments: ProductsScreenArgumentsModel(
        title: category.title,
        products: products,
      ),
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
          height: 64.h,
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
                    height: 40.r,
                    width: 40.r,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return Skeleton(
                          height: 40.r,
                          width: 40.r,
                          borderRadius: BorderRadius.circular(100),
                        );
                      }

                      return child;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    category.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
