import 'package:clot/data/products_provider.dart';
import 'package:clot/models/category.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments.dart';
import 'package:clot/screens/products_screen.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          if (value.isLoading) {
            return const _SkeletonCategories();
          }

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

class _SkeletonCategories extends StatelessWidget {
  const _SkeletonCategories();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [1, 2, 3, 4, 5]
          .map(
            (_) => _CategoryItem(
              category: Category.empty(),
              isLoading: true,
            ),
          )
          .toList(),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.category, this.isLoading = false});

  final Category category;
  final bool isLoading;

  void onTap(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context, listen: false)
        .getByCategoryID(category.id);
    Navigator.pushNamed(
      context,
      ProductsScreen.routeName,
      arguments: ProductsScreenArguments(
        title: category.title,
        products: products,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
      },
      child: SizedBox(
        height: 80.h,
        width: 56.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading
                ? Skeleton(
                    height: 56.h,
                    width: 56.w,
                    borderRadius: BorderRadius.circular(100),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      category.image,
                      fit: BoxFit.cover,
                      height: 56.h,
                      width: 56.w,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return Skeleton(
                            height: 56.h,
                            width: 56.w,
                            borderRadius: BorderRadius.circular(100),
                          );
                        }

                        return child;
                      },
                    ),
                  ),
            const Spacer(),
            isLoading
                ? const Skeleton(
                    child: Text("Loading"),
                  )
                : Text(
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