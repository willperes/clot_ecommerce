import 'package:clot/data/products_provider.dart';
import 'package:clot/screens/categories_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/widgets/bottom_navigation.dart';
import 'package:clot/widgets/products_screen/categories.dart';
import 'package:clot/widgets/products_screen/new_in_section.dart';
import 'package:clot/widgets/products_screen/section_title.dart';
import 'package:clot/widgets/products_screen/top_selling.dart';
import 'package:flutter/material.dart';
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
    const _HomeScreenContent(),
    const _HomeScreenContent(),
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
      ).getProducts();
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

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
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
                  const SizedBox(
                    height: Constants.screenPadding,
                  ),
                  const SectionTitle(
                    text: "Top Selling",
                  ),
                ],
              ),
            ),
            const TopSellingSection(),
            const SizedBox(
              height: Constants.screenPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.screenPadding,
              ),
              child: SectionTitle(
                text: "New In",
                textColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const NewInSection(),
            const SizedBox(
              height: Constants.screenPadding,
            ),
          ],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
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
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 12,
                    ),
                    child: Icon(
                      Icons.search,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Search",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
