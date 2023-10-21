import 'package:clot/models/product_model.dart';

const String _image =
    "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-mono-81x100.png";

const ProductModel productModelMock = ProductModel(
  id: 1,
  title: "Product Title",
  subtitle: "Product Subtitle",
  description: "Product Description",
  images: [_image, _image],
  price: 100.0,
  categoryID: 1,
  sizes: ["S", "M"],
);

final Map<String, dynamic> productModelJsonMock = {
  'id': 1,
  'title': 'Product Title',
  'subtitle': 'Product Subtitle',
  'description': 'Product Description',
  'images': [
    "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-mono-81x100.png",
    "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-mono-81x100.png"
  ],
  'price': 100,
  'categoryID': 1,
  'sizes': ["S", "M"],
};
