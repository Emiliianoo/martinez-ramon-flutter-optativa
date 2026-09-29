import 'dart:convert';

import 'package:http/http.dart' as http;

import 'product_model.dart';

class ProductApi {
  static const _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    _checkResponse(response);

    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((product) => Product.fromJson(product as Map<String, dynamic>))
        .toList();
  }

  Future<Product> getProduct(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));
    _checkResponse(response);

    return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  void _checkResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('No se pudieron cargar los productos.');
    }
  }
}
