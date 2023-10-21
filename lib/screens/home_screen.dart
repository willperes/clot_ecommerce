import 'package:clot/data/cart_provider.dart';
import 'package:clot/data/products_provider.dart';
import 'package:clot/models/screen_arguments/products_screen_arguments_model.dart';
import 'package:clot/screens/cart_screen.dart';
import 'package:clot/screens/categories_screen.dart';
import 'package:clot/screens/notifications_screen.dart';
import 'package:clot/screens/orders_screen.dart';
import 'package:clot/screens/products_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/bottom_navigation.dart';
import 'package:clot/widgets/home_screen_content/categories.dart';
import 'package:clot/widgets/home_screen_content/new_in_section.dart';
import 'package:clot/widgets/home_screen_content/section_title.dart';
import 'package:clot/widgets/home_screen_content/top_selling.dart';
import 'package:clot/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final screens = [
    const _HomeScreenContent(),
    NotificationsScreen(),
    OrdersScreen(),
    const _HomeScreenContent(),
  ];

  void setSelectedTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductsProvider>(
        context,
        listen: false,
      ).getData();

      Provider.of<CartProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        setSelectedTab: setSelectedTab,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent();

  @override
  Widget build(BuildContext context) {
    void onCategoriesTap() {
      Navigator.pushNamed(context, CategoriesScreen.routeName);
    }

    void onTopSellingTap() {
      final products = Provider.of<ProductsProvider>(context, listen: false)
          .topSellingProducts;
      Navigator.pushNamed(
        context,
        ProductsScreen.routeName,
        arguments: ProductsScreenArgumentsModel(
          title: "Top Selling",
          products: products,
        ),
      );
    }

    void onNewInTap() {
      final products =
          Provider.of<ProductsProvider>(context, listen: false).newInProducts;
      Navigator.pushNamed(
        context,
        ProductsScreen.routeName,
        arguments: ProductsScreenArgumentsModel(
          title: "New In",
          products: products,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Provider.of<ProductsProvider>(context, listen: false)
                .getData();
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.screenPadding,
                ),
                child: Column(
                  children: [
                    const _Header(),
                    SectionTitle(
                      text: "Categories",
                      onTap: onCategoriesTap,
                    ),
                    const CategoriesSection(),
                    SizedBox(
                      height: Constants.screenPadding,
                    ),
                    SectionTitle(
                      text: "Top Selling",
                      onTap: onTopSellingTap,
                    ),
                  ],
                ),
              ),
              const TopSellingSection(),
              SizedBox(
                height: Constants.screenPadding,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.screenPadding,
                ),
                child: SectionTitle(
                  text: "New In",
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: onNewInTap,
                ),
              ),
              const NewInSection(),
              SizedBox(
                height: Constants.screenPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Constants.screenPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40.r,
              width: 40.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              child: Ink(
                height: 40.r,
                width: 40.r,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 20.r,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: SearchBarPlaceholder(),
        ),
      ],
    );
  }
}
