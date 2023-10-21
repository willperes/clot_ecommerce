import 'package:clot/models/product_model.dart';
import 'package:test/test.dart';

import '../../mocks/models/product_model.mocks.dart';

void main() {
  test('Test JSON to ProductModel', () {
    expect(ProductModel.fromJson(productModelJsonMock), productModelMock);
  });
}
