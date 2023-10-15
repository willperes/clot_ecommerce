import 'package:clot/screens/categories_screen.dart';
import 'package:clot/theme/constants.dart';
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
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/orders_screen.svg"),
          const SizedBox(height: Constants.screenPadding),
          Text(
            "No orders yet",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: Constants.screenPadding),
          SizedBox(
            width: 192,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, CategoriesScreen.routeName);
              },
              child: const Text("Explore Categories"),
            ),
          )
        ],
      ),
    );
  }
}
