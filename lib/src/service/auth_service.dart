import 'dart:convert';

import 'package:enviro_bank/src/config.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends Equatable {
  final WebClient _webClient;

  const AuthService({
    required WebClient webClient,
  }) : _webClient = webClient;

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _webClient.post(
      endpoint: '/users/login',
      body: {
        'emailAddress': email,
        'password': password,
      },
    );
    if (response?.statusCode != 200) return null;
    final decoded = json.decode(response!.body);
    final token = decoded['jwt'];
    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(Config.tokenKey, token);
    }
    return token;
  }

  Future<bool> registerAccount({
    required String email,
    required String password,
  }) async {
    final response = await _webClient.post(
      endpoint: '/users',
      body: {
        'emailAddress': email,
        'password': password,
      },
    );
    if (response?.statusCode != 200) return false;
    final decoded = json.decode(response!.body);
    return decoded['success'] == true;
  }

  @override
  List<Object> get props => [_webClient];
}
