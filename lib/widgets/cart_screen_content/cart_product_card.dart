import 'package:clot/data/cart_provider.dart';
import 'package:clot/models/cart_item.dart';
import 'package:clot/models/product.dart';
import 'package:clot/widgets/circular_icon_button.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.product,
    required this.size,
    required this.quantity,
    required this.isLoading,
  });

  final Product product;
  final int quantity;
  final String size;
  final bool isLoading;

  void changeQuantity(BuildContext context, int qty) {
    Provider.of<CartProvider>(context, listen: false).addToCart(
      item: CartItem(
        productId: product.id,
        productSize: size,
        productPrice: product.price,
        quantity: qty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: isLoading
                          ? Skeleton(height: 64.r, width: 64.r)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.images[0],
                                height: 64.r,
                                width: 64.r,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isLoading
                              ? Skeleton(
                                  child: Text(
                                    "Cart Product Card Title",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                )
                              : Text(
                                  product.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              isLoading
                                  ? Skeleton(
                                      child: Text(
                                        "Size: A",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    )
                                  : Text.rich(
                                      TextSpan(
                                        text: "Size: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: size,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                              SizedBox(width: 16.w),
                              isLoading
                                  ? Skeleton(
                                      child: Text(
                                        "Qty: 0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    )
                                  : Text.rich(
                                      TextSpan(
                                        text: "Qty: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: quantity.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 50,
                  width: 60.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      isLoading
                          ? Skeleton(
                              child: Text(
                                "\$00.00",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            )
                          : Text(
                              "\$${(product.price * quantity).toStringAsFixed(2)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircularIconButton(
                            height: 24,
                            width: 24,
                            iconData: Icons.add,
                            iconSize: 12,
                            isLoading: isLoading,
                            onTap: () {
                              changeQuantity(context, quantity + 1);
                            },
                          ),
                          SizedBox(width: 8.w),
                          CircularIconButton(
                            height: 24,
                            width: 24,
                            iconData: Icons.remove,
                            iconSize: 12,
                            isLoading: isLoading,
                            onTap: () {
                              changeQuantity(context, quantity - 1);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
