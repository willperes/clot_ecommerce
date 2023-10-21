import 'package:clot/models/product_data_model.dart';
import 'package:test/test.dart';

import '../../mocks/models/product_data_model.mocks.dart';

void main() {
  test('Test JSON to ProductDataModel', () {
    expect(
      ProductDataModel.fromJson(productDataModelJsonMock),
      productDataModelMock,
    );
  });
}
