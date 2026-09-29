import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  static const _loginUrl = 'https://dummyjson.com/auth/login';

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
    );

    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
