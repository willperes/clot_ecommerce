import 'package:clot/screens/categories_screen.dart';
import 'package:clot/widgets/empty_screen_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final _orders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: const _NoOrdersContent(),
    );
  }
}

class _NoOrdersContent extends StatelessWidget {
  const _NoOrdersContent();

  @override
  Widget build(BuildContext context) {
    return EmptyScreenPlaceholder(
        image: SvgPicture.asset('assets/images/orders_screen.svg'),
        text: 'No orders yet',
        buttonText: 'Explore Categories',
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(CategoriesScreen.routeName);
        });
  }
}
