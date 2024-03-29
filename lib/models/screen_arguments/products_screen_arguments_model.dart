import 'package:clot/models/product_model.dart';

class ProductsScreenArgumentsModel {
  final String title;
  final List<ProductModel> products;

  const ProductsScreenArgumentsModel({
    required this.title,
    required this.products,
  });
}
