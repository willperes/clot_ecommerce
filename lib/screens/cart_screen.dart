import 'package:clot/data/cart_provider.dart';
import 'package:clot/data/products_provider.dart';
import 'package:clot/models/product.dart';
import 'package:clot/screens/categories_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/cart_screen_content/cart_product_card.dart';
import 'package:clot/widgets/cart_screen_content/order_summary.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/empty_screen_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
        title: const Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const _CartContent();
          }

          return value.productsInCart.isNotEmpty
              ? const _CartContent()
              : const _EmptyCart();
        },
      ),
    );
  }
}

class _CartContent extends StatelessWidget {
  const _CartContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Constants.screenPadding,
        right: Constants.screenPadding,
        bottom: Constants.screenPadding,
      ),
      child: Column(
        children: [
          const Expanded(
            child: CustomScrollView(
              slivers: [_CartProductList()],
            ),
          ),
          const SizedBox(height: Constants.screenPadding),
          const OrderSummary(),
          SizedBox(height: 50.h),
          TextButton(
            onPressed: () {},
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}

class _CartProductList extends StatelessWidget {
  const _CartProductList();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) {
        return SliverList.builder(
          itemBuilder: (context, index) {
            if (value.isLoading) {
              return CartProductCard(
                product: Product.empty(),
                size: "",
                quantity: 0,
                isLoading: true,
              );
            }

            final productList =
                Provider.of<ProductsProvider>(context, listen: false).products;
            final cartItem = value.productsInCart[index];
            final product = productList.firstWhere(
                (p) => p.id == cartItem.productId,
                orElse: () => Product.empty());

            if (product.id == 0) {
              return Container();
            }

            return CartProductCard(
              product: product,
              quantity: cartItem.quantity,
              size: cartItem.productSize,
              isLoading: value.isLoading,
            );
          },
          itemCount: value.isLoading ? 6 : value.productsInCart.length,
        );
      },
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return EmptyScreenPlaceholder(
        image: SvgPicture.asset('assets/images/search.svg'),
        text: 'Your cart is empty',
        buttonText: 'Explore Categories',
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(CategoriesScreen.routeName);
        });
  }
}
