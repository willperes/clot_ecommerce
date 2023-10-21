import 'package:clot/models/category_model.dart';
import 'package:clot/models/product_model.dart';

class ProductDataModel {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final List<ProductModel> topSellingProducts;
  final List<ProductModel> newInProducts;

  const ProductDataModel({
    required this.products,
    required this.categories,
    required this.topSellingProducts,
    required this.newInProducts,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> data) {
    final List<dynamic> productsJson = data["products"];
    final List<dynamic> categoriesJson = data["categories"];
    final List<dynamic> topSellingProductsJson = data["topSellingProducts"];
    final List<dynamic> newInProductsJson = data["newInProducts"];

    final List<ProductModel> products =
        productsJson.map((product) => ProductModel.fromJson(product)).toList();
    final List<CategoryModel> categories = categoriesJson
        .map((category) => CategoryModel.fromJson(category))
        .toList();
    final List<ProductModel> topSellingProducts = topSellingProductsJson
        .map((product) => ProductModel.fromJson(product))
        .toList();
    final List<ProductModel> newInProducts = newInProductsJson
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return ProductDataModel(
      products: products,
      categories: categories,
      topSellingProducts: topSellingProducts,
      newInProducts: newInProducts,
    );
  }
}
