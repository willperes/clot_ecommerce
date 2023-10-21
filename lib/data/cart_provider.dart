import 'package:clot/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  CartProvider();

  bool _isLoading = true;
  List<CartItemModel> _productsInCart = [];
  final double _shippingPrice = 10.0;

  bool get isLoading => _isLoading;
  List<CartItemModel> get productsInCart => _productsInCart;
  double get shippingPrice => _shippingPrice;

  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();

    // Future only to simulate the latency of an API call.
    await Future.delayed(
      const Duration(seconds: 3),
    );

    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString('cart_items');

    if (data != null) {
      _productsInCart = CartItemModel.decode(data);
    } else {
      _productsInCart = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void addToCart(
      {required CartItemModel item, bool shouldSumQuantity = false}) async {
    final isAlreadyInCart = _productsInCart.where(
      (product) =>
          product.productId == item.productId &&
          product.productSize == item.productSize,
    );

    if (isAlreadyInCart.isEmpty) {
      final newList = [...productsInCart, item];
      await _saveCart(newList);
      _productsInCart = [...productsInCart, item];
      notifyListeners();

      return;
    }

    final productIndex = _productsInCart.indexWhere(
      (product) =>
          product.productId == item.productId &&
          product.productSize == item.productSize,
    );

    if (productIndex == -1) {
      return;
    }

    var newList = [..._productsInCart];

    if (item.quantity == 0) {
      newList.removeAt(productIndex);
      await _saveCart(newList);
      _productsInCart = [...newList];

      notifyListeners();
      return;
    }

    final newItem = shouldSumQuantity
        ? CartItemModel(
            productId: item.productId,
            productSize: item.productSize,
            productPrice: item.productPrice,
            quantity: item.quantity + _productsInCart[productIndex].quantity)
        : item;

    newList[productIndex] = newItem;
    await _saveCart(newList);
    _productsInCart = newList;
    notifyListeners();
  }

  Future<void> _saveCart(List<CartItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();

    final cartJson = CartItemModel.encode(items);

    prefs.setString('cart_items', cartJson);
  }
}
