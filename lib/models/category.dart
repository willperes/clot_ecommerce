import 'package:clot/models/product.dart';

class Category {
  final String name;
  final ProductCategory value;
  final String image;

  const Category({
    required this.name,
    required this.value,
    required this.image,
  });
}
