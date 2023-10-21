import 'package:clot/data/cart_provider.dart';
import 'package:clot/models/cart_item_model.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  double getTotalPrice(List<CartItemModel> products) {
    var totalPrice = 0.0;

    for (var product in products) {
      totalPrice += (product.productPrice * product.quantity);
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                value.isLoading
                    ? Skeleton(
                        child: Text(
                          "Subtotal",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      )
                    : Text(
                        "Subtotal",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                value.isLoading
                    ? Skeleton(
                        child: Text(
                          "\$000.00",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      )
                    : Text(
                        "\$${getTotalPrice(value.productsInCart).toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                value.isLoading
                    ? Skeleton(
                        child: Text(
                          "Shipping Cost",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      )
                    : Text(
                        "Shipping Cost",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                value.isLoading
                    ? Skeleton(
                        child: Text(
                          "\$00.00",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      )
                    : Text("\$${value.shippingPrice.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                value.isLoading
                    ? Skeleton(
                        child: Text(
                          "Total",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      )
                    : Text(
                        "Total",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                value.isLoading
                    ? Skeleton(
                        child: Text(
                          "\$000.00",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      )
                    : Text(
                        "\$${(getTotalPrice(value.productsInCart) + value.shippingPrice).toStringAsFixed(2)}",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 12.h),
          ],
        );
      },
    );
  }
}
