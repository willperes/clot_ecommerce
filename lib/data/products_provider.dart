import 'package:clot/models/category_model.dart';
import 'package:clot/models/product_model.dart';
import 'package:clot/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final _productService = ProductService();

  ProductsProvider();

  bool _isLoading = false;
  List<ProductModel> _products = [];
  List<CategoryModel> _categories = [];
  List<ProductModel> _topSellingProducts = [];
  List<ProductModel> _newInProducts = [];

  bool get isLoading => _isLoading;
  List<ProductModel> get products => _products;
  List<CategoryModel> get categories => _categories;
  List<ProductModel> get topSellingProducts => _topSellingProducts;
  List<ProductModel> get newInProducts => _newInProducts;

  Future<void> getData() async {
    try {
      _isLoading = true;
      notifyListeners();
      final data = await _productService.getAll();

      _products = data.products;
      _categories = data.categories;
      _topSellingProducts = data.topSellingProducts;
      _newInProducts = data.newInProducts;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // TODO: handle exception
    }
  }

  List<ProductModel> getByCategoryID(int categoryID) {
    final category =
        _categories.firstWhere((category) => category.id == categoryID);
    final products = _products
        .where((product) => product.categoryID == category.id)
        .toList();

    return products;
  }
}
