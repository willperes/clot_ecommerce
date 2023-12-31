import 'package:clot/models/product_model.dart';
import 'package:clot/models/screen_arguments/product_details_screen_arguments_model.dart';
import 'package:clot/screens/product_details_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.isLoading = false});

  final ProductModel product;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final cardWidth = 159.w;

    void onTap() {
      Navigator.pushNamed(
        context,
        ProductDetailsScreen.routeName,
        arguments: ProductDetailsScreenArgumentsModel(
          product: product,
        ),
      );
    }

    return Stack(
      children: [
        Container(
          height: Constants.productCardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isLoading
                  ? Skeleton(
                      height: 220.h,
                      width: double.infinity,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.network(
                        product.images[0],
                        height: 220.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return Skeleton(
                              height: 220.h,
                              width: double.infinity,
                            );
                          }

                          return child;
                        },
                      ),
                    ),
              Expanded(
                child: SizedBox(
                  width: cardWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLoading
                            ? Skeleton(
                                width: cardWidth * 0.8,
                                child: const Text(""),
                              )
                            : Text(
                                product.title,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: isLoading
                              ? Skeleton(
                                  width: cardWidth * 0.3,
                                  child: const Text(""),
                                )
                              : Text(
                                  "\$${product.price.toStringAsFixed(2)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                onTap();
              },
            ),
          ),
        ),
        !isLoading
            ? Positioned(
                top: 5.r,
                right: 8.r,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      print("Favorited");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 24.r,
                      width: 24.r,
                      child: Icon(
                        Icons.favorite_outline,
                        size: 16,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
