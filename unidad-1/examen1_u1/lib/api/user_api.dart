import 'dart:convert';

import 'package:http/http.dart' as http;

import 'user_model.dart';

class UserApi {
  static const _baseUrl = 'https://fakestoreapi.com';

  Future<User> getUser(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$id'));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('No se pudo cargar el usuario.');
    }

    return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
