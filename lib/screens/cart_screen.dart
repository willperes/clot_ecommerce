import 'package:clot/screens/categories_screen.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/empty_screen_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const DefaultBackButton()),
      body: const _EmptyCart(),
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
