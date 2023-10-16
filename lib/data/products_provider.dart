import 'package:clot/models/category.dart';
import 'package:clot/models/product.dart';
import 'package:clot/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final _productService = ProductService();

  ProductsProvider();

  bool _isLoading = false;
  List<Product> _products = [];
  List<Category> _categories = [];
  List<Product> _topSellingProducts = [];
  List<Product> _newInProducts = [];

  bool get isLoading => _isLoading;
  List<Product> get products => _products;
  List<Category> get categories => _categories;
  List<Product> get topSellingProducts => _topSellingProducts;
  List<Product> get newInProducts => _newInProducts;

  void getData() async {
    _isLoading = true;
    notifyListeners();
    final data = await _productService.getAll();

    if (data == null) {
      // TODO: handle exception
      _isLoading = false;
      notifyListeners();
      return;
    }

    _products = data.products;
    _categories = data.categories;
    _topSellingProducts = data.topSellingProducts;
    _newInProducts = data.newInProducts;
    _isLoading = false;
    notifyListeners();
  }

  List<Product> getByCategoryID(int categoryID) {
    final category =
        _categories.firstWhere((category) => category.id == categoryID);
    final products = _products
        .where((product) => product.categoryID == category.id)
        .toList();

    return products;
  }
}
