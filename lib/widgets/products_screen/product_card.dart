import 'package:clot/models/product.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.isLoading = false});

  final Product product;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.4;

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
                  ? const Skeleton(
                      height: Constants.productCardHeight * 0.78,
                      width: double.infinity,
                      borderRadius: BorderRadius.only(
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
                        height: Constants.productCardHeight * 0.78,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return const Skeleton(
                              height: Constants.productCardHeight * 0.78,
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
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
