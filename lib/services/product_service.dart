import 'dart:convert';
import 'dart:io';

import 'package:clot/models/product_data.dart';
import 'package:clot/services/web_client.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final _client = WebClient().client;
  final _baseURL = WebClient.baseURL;

  Future<ProductData?> getAll() async {
    http.Response response = await _client.get(
      Uri.parse("${_baseURL}product/home/"),
    );

    if (response.statusCode ~/ 100 != 2) {
      throw HttpException(response.body);
    }

    final Map<String, dynamic> dynamicList = json.decode(response.body);
    return ProductData.fromJson(dynamicList);
  }
}
