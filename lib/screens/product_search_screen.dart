import 'package:clot/data/products_provider.dart';
import 'package:clot/models/product_model.dart';
import 'package:clot/screens/categories_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:clot/utils/debouncer.dart';
import 'package:clot/widgets/default_back_button.dart';
import 'package:clot/widgets/empty_screen_placeholder.dart';
import 'package:clot/widgets/product_grid.dart';
import 'package:clot/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatefulWidget {
  static const routeName = 'product-search';

  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => __ProductSearchScreenStateState();
}

class __ProductSearchScreenStateState extends State<ProductSearchScreen> {
  List<ProductModel> filteredProducts = [];
  bool hasNoResults = false;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final debouncer = Debouncer(milliseconds: 750);

  void onChanged(String value) {
    debouncer.run(() {
      handleSearch(value: value);
    });
  }

  void onClear() {
    handleSearch(value: '');
  }

  void handleSearch({required String value}) {
    if (value.isEmpty) {
      setState(() {
        hasNoResults = false;
        filteredProducts =
            Provider.of<ProductsProvider>(context, listen: false).products;
      });
      return;
    }

    final products =
        Provider.of<ProductsProvider>(context, listen: false).products;
    final listFiltered = products
        .where(
          (product) =>
              product.title.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              product.subtitle.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
        )
        .toList();

    setState(() {
      hasNoResults = listFiltered.isEmpty;
      filteredProducts = listFiltered;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      focusNode.requestFocus();
      filteredProducts =
          Provider.of<ProductsProvider>(context, listen: false).products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomSearchBar(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          onClear: onClear,
        ),
        leading: const DefaultBackButton(),
      ),
      body: hasNoResults
          ? const _NoResults()
          : Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.screenPadding),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      '${filteredProducts.length} Results Found',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  ProductGrid(products: filteredProducts),
                ],
              ),
            ),
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults();

  @override
  Widget build(BuildContext context) {
    return EmptyScreenPlaceholder(
        image: SvgPicture.asset('assets/images/search.svg'),
        text: 'Sorry, we couldn\'t find any matching result for your search.',
        buttonText: 'Explore Categories',
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(CategoriesScreen.routeName);
        });
  }
}
