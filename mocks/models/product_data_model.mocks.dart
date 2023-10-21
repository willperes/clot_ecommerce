import 'package:clot/models/product_data_model.dart';

import 'category_model.mocks.dart';
import 'product_model.mocks.dart';

const ProductDataModel productDataModelMock = ProductDataModel(
  products: [productModelMock],
  categories: [categoryModelMock],
  topSellingProducts: [productModelMock],
  newInProducts: [productModelMock],
);

final Map<String, dynamic> productDataModelJsonMock = {
  'categories': [categoryModelJsonMock],
  'products': [productModelJsonMock],
  'newInProducts': [productModelJsonMock],
  'topSellingProducts': [productModelJsonMock],
};
