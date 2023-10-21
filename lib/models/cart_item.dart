import 'dart:convert';

class CartItem {
  final int productId;
  final String productSize;
  final double productPrice;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.productSize,
    required this.productPrice,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> jsonData) => CartItem(
        productId: jsonData['productId'],
        productSize: jsonData['productSize'],
        productPrice: jsonData['productPrice'],
        quantity: jsonData['quantity'],
      );

  static Map<String, dynamic> toMap(CartItem item) => {
        'productId': item.productId,
        'productSize': item.productSize,
        'productPrice': item.productPrice,
        'quantity': item.quantity,
      };

  static String encode(List<CartItem> items) => json.encode(
        items
            .map(
              (item) => CartItem.toMap(item),
            )
            .toList(),
      );

  static List<CartItem> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map(
            (item) => CartItem.fromJson(item),
          )
          .toList();
}
