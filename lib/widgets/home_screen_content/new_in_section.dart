import 'package:clot/data/products_provider.dart';
import 'package:clot/models/product.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/home_screen_content/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NewInSection extends StatefulWidget {
  const NewInSection({super.key});

  @override
  State<NewInSection> createState() => _NewInSectionState();
}

class _NewInSectionState extends State<NewInSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: SizedBox(
        height: Constants.productCardHeight,
        child: Consumer<ProductsProvider>(
          builder: (context, value, child) {
            final list = value.newInProducts.sublist(
                0,
                value.newInProducts.length < 10
                    ? value.newInProducts.length
                    : 10);

            return ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.screenPadding,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (value.isLoading) {
                  return ProductCard(
                    product: Product.empty(),
                    isLoading: true,
                  );
                }

                final product = list[index];

                return ProductCard(product: product);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.w,
                );
              },
              itemCount: value.isLoading ? 3 : list.length,
            );
          },
        ),
      ),
    );
  }
}
