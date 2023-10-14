import 'package:clot/data/category_list.dart';
import 'package:clot/data/product_list.dart';
import 'package:clot/models/category.dart';
import 'package:clot/models/product.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsProvider();

  List<Product> _products = [];
  List<Category> _categories = [];

  List<Product> get products => _products;
  List<Category> get categories => _categories;

  void getProducts() {
    _products = productList;
    _getCategories();
    notifyListeners();
  }

  void _getCategories() {
    final List<ProductCategory> availableCategories = [];
    for (var product in products) {
      availableCategories.add(product.category);
    }

    final List<Category> categories = [];

    for (var category in categoryList) {
      for (var availableCategory in availableCategories) {
        if (category.value == availableCategory) {
          categories.add(category);
        }
      }
    }

    _categories = categories.toSet().toList();
  }
}
