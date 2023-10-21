import 'package:clot/models/category_model.dart';

const String _image =
    "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-mono-81x100.png";

const CategoryModel categoryModelMock =
    CategoryModel(id: 1, title: "Shoes", image: _image);

final Map<String, dynamic> categoryModelJsonMock = {
  'id': 1,
  'title': 'Shoes',
  'image':
      'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-mono-81x100.png',
};
