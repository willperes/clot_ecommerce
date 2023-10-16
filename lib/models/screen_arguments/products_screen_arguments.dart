import 'package:clot/models/product.dart';

class ProductsScreenArguments {
  final String title;
  final List<Product> products;

  const ProductsScreenArguments({required this.title, required this.products});
}
