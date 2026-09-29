import 'dart:convert';

import 'package:http/http.dart' as http;

import 'cart_model.dart';

class CartApi {
  static const _baseUrl = 'https://fakestoreapi.com';

  Future<List<Carrito>> getCarts() async {
    final response = await http.get(Uri.parse('$_baseUrl/carts'));
    _checkResponse(response);

    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((cart) => Carrito.fromJson(cart as Map<String, dynamic>))
        .toList();
  }

  Future<Carrito> getCart(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/carts/$id'));
    _checkResponse(response);

    return Carrito.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  void _checkResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('No se pudieron cargar los carritos.');
    }
  }
}
