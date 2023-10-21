import 'package:clot/data/cart_provider.dart';
import 'package:clot/data/mocks/product_review_mocks.dart';
import 'package:clot/models/cart_item.dart';
import 'package:clot/models/product.dart';
import 'package:clot/models/product_review.dart';
import 'package:clot/models/screen_arguments/product_details_screen_arguments.dart';
import 'package:clot/screens/cart_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/utils/show_custom_bottom_sheet.dart';
import 'package:clot/widgets/bottom_sheet_list_item.dart';
import 'package:clot/widgets/bottom_sheet_list_opener.dart';
import 'package:clot/widgets/circular_icon_button.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = "product-details";

  const ProductDetailsScreen({super.key, required this.arguments});

  final ProductDetailsScreenArguments arguments;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String _selectedSize;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.arguments.product.sizes[0];
  }

  void onAddToBag() {
    final item = CartItem(
        productId: widget.arguments.product.id,
        productSize: _selectedSize,
        quantity: _quantity);
    Provider.of<CartProvider>(context, listen: false)
        .addToCart(item: item, shouldSumQuantity: true);
    Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.arguments.product;

    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
      ),
      body: CustomScrollView(
        slivers: [
          _ImageList(
            product: product,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: Constants.screenPadding,
              left: Constants.screenPadding,
              right: Constants.screenPadding,
              bottom: Constants.screenPadding,
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  BottomSheetListOpener(
                    title: "Size",
                    onTap: () {
                      showModalBottomSheetList(
                        title: "Size",
                        context: context,
                        list: SliverList.builder(
                          itemBuilder: (context, index) {
                            return BottomSheetListItem(
                              isFirst: index == 0,
                              isSelected: product.sizes[index] == _selectedSize,
                              title: product.sizes[index],
                              onTap: () {
                                setState(() {
                                  _selectedSize = product.sizes[index];
                                });
                                Navigator.pop(context);
                              },
                            );
                          },
                          itemCount: product.sizes.length,
                        ),
                      );
                    },
                    child: Text(
                      _selectedSize,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary),
                          ),
                          Row(
                            children: [
                              CircularIconButton(
                                height: 40,
                                width: 40,
                                iconData: Icons.add,
                                iconSize: 16,
                                onTap: () {
                                  setState(() {
                                    if (_quantity < 99) {
                                      _quantity = _quantity + 1;
                                    }
                                  });
                                },
                              ),
                              Container(
                                width: 40.w,
                                alignment: Alignment.center,
                                child: Text("$_quantity"),
                              ),
                              CircularIconButton(
                                height: 40,
                                width: 40,
                                iconData: Icons.remove,
                                iconSize: 16,
                                onTap: () {
                                  setState(() {
                                    if (_quantity <= 1) {
                                      _quantity = 1;
                                      return;
                                    }

                                    _quantity = _quantity - 1;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Shipping & Returns",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Free standard shipping and free 60-day returns",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const _Reviews(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: _AddToBagButton(
            product: product,
            selectedQuantity: _quantity,
            onTap: onAddToBag,
          ),
        ),
      ),
    );
  }
}

class _ImageList extends StatelessWidget {
  const _ImageList({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 248.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.screenPadding,
          ),
          itemBuilder: (context, index) {
            return Image.network(
              product.images[index],
              fit: BoxFit.cover,
              height: 248.h,
              width: 161.w,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return Skeleton(height: 248.h, width: 161.w);
                }

                return child;
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount: product.images.length,
        ),
      ),
    );
  }
}

class _AddToBagButton extends StatelessWidget {
  const _AddToBagButton({
    required this.product,
    required this.onTap,
    required this.selectedQuantity,
  });

  final Product product;
  final int selectedQuantity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Ink(
        height: 56.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${(product.price * selectedQuantity).toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Text(
                "Add to Bag",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Reviews extends StatelessWidget {
  const _Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(
          "Reviews",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          "3.6 Ratings",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          "3 Reviews",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        const SizedBox(height: 4),
        _ReviewEntry(
          review: productReviewMocks[0],
        ),
        _ReviewEntry(
          review: productReviewMocks[1],
        ),
        _ReviewEntry(
          review: productReviewMocks[2],
        ),
      ],
    );
  }
}

class _ReviewEntry extends StatelessWidget {
  const _ReviewEntry({required this.review});

  final ProductReview review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      review.userName,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [1, 2, 3, 4, 5].map((e) {
                  return Icon(
                    Icons.star,
                    size: 16,
                    color: review.rating >= e
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary,
                  );
                }).toList(),
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            review.comment,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            "10 days ago",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
