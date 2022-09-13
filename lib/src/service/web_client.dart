import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class WebClient extends Equatable {
  final String baseUrl;
  final String? jwtToken;
  final int timeoutSeconds;

  const WebClient({
    required this.baseUrl,
    this.jwtToken,
     this.timeoutSeconds = 15,
  });

  @override
  List<Object?> get props => [baseUrl, jwtToken, timeoutSeconds];

  Map<String, String> _requestHeaders() {
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (jwtToken != null) {
      headers[HttpHeaders.authorizationHeader] = "Bearer $jwtToken";
    }
    return headers;
  }

  FutureOr<http.Response?> get({
    required String endpoint,
  }) async {
    final headers = _requestHeaders();
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http
        .get(
          uri,
          headers: headers,
        )
        .timeout(
          Duration(seconds: timeoutSeconds),
        );
    _checkResponseStatus(response);
    return response;
  }

  FutureOr<http.Response?> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    final headers = _requestHeaders();
    final jsonBody = jsonEncode(body);
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http
        .post(
          uri,
          body: jsonBody,
          headers: headers,
        )
        .timeout(Duration(seconds: timeoutSeconds));
    _checkResponseStatus(response);
    return response;
  }

  void _checkResponseStatus(http.Response response) {
    if (response.statusCode == 401) {
      throw UnauthorizedException();
    }
  }
}

class UnauthorizedException implements Exception {}
