import 'package:clot/models/category.dart';
import 'package:clot/models/product.dart';

class ProductData {
  final List<Product> products;
  final List<Category> categories;
  final List<Product> topSellingProducts;
  final List<Product> newInProducts;

  const ProductData({
    required this.products,
    required this.categories,
    required this.topSellingProducts,
    required this.newInProducts,
  });

  factory ProductData.fromJson(Map<String, dynamic> data) {
    final List<dynamic> productsJson = data["products"];
    final List<dynamic> categoriesJson = data["categories"];
    final List<dynamic> topSellingProductsJson = data["topSellingProducts"];
    final List<dynamic> newInProductsJson = data["newInProducts"];

    final List<Product> products =
        productsJson.map((product) => Product.fromJson(product)).toList();
    final List<Category> categories =
        categoriesJson.map((category) => Category.fromJson(category)).toList();
    final List<Product> topSellingProducts = topSellingProductsJson
        .map((product) => Product.fromJson(product))
        .toList();
    final List<Product> newInProducts =
        newInProductsJson.map((product) => Product.fromJson(product)).toList();

    return ProductData(
      products: products,
      categories: categories,
      topSellingProducts: topSellingProducts,
      newInProducts: newInProducts,
    );
  }
}
