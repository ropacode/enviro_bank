
import 'dart:convert';

import 'package:enviro_bank/src/service/web_client.dart';
import 'package:equatable/equatable.dart';

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
    return decoded['jwt'];
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
