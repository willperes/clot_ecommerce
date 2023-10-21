import 'dart:convert';

class CartItemModel {
  final int productId;
  final String productSize;
  final double productPrice;
  final int quantity;

  const CartItemModel({
    required this.productId,
    required this.productSize,
    required this.productPrice,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) =>
      CartItemModel(
        productId: jsonData['productId'],
        productSize: jsonData['productSize'],
        productPrice: jsonData['productPrice'],
        quantity: jsonData['quantity'],
      );

  static Map<String, dynamic> toMap(CartItemModel item) => {
        'productId': item.productId,
        'productSize': item.productSize,
        'productPrice': item.productPrice,
        'quantity': item.quantity,
      };

  static String encode(List<CartItemModel> items) => json.encode(
        items
            .map(
              (item) => CartItemModel.toMap(item),
            )
            .toList(),
      );

  static List<CartItemModel> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map(
            (item) => CartItemModel.fromJson(item),
          )
          .toList();
}
