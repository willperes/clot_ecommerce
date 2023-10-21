import 'package:clot/models/category_model.dart';
import 'package:test/test.dart';

import '../../mocks/models/category_model.mocks.dart';

void main() {
  test('Test JSON to CategoryModel', () {
    expect(CategoryModel.fromJson(categoryModelJsonMock), categoryModelMock);
  });
}
