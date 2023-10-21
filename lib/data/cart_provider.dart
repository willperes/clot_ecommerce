import 'package:clot/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  CartProvider();

  bool _isLoading = false;
  List<CartItem> _productsInCart = [];

  bool get isLoading => _isLoading;
  List<CartItem> get productsInCart => _productsInCart;

  Future<void> getData() async {
    // TODO
  }

  void addToCart({required CartItem item, bool shouldSumQuantity = false}) {
    final isAlreadyInCart = _productsInCart.where(
      (product) =>
          product.productId == item.productId &&
          product.productSize == item.productSize,
    );

    if (isAlreadyInCart.isEmpty) {
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
      _productsInCart = newList;

      notifyListeners();
      return;
    }

    final newItem = shouldSumQuantity
        ? CartItem(
            productId: item.productId,
            productSize: item.productSize,
            quantity: item.quantity + _productsInCart[productIndex].quantity)
        : item;

    newList[productIndex] = newItem;
    _productsInCart = newList;
    notifyListeners();
  }
}
