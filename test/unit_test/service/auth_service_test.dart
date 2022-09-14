import 'package:enviro_bank/src/service/auth_service.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([WebClient])
void main() {
  group('AuthService', () {
    late WebClient webClient;
    late AuthService service;
    setUp(() {
      SharedPreferences.setMockInitialValues({});
      webClient = MockWebClient();
      service = AuthService(webClient: webClient);
    });

    group('registerAccount', () {
      test('should return true when success', () async {
        when(webClient.post(endpoint: '/users', body: {
          'emailAddress': 'ropa@gmail.com',
          'password': 'Password@1',
        })).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"success": true}', 200),
          ),
        );

        final response = await service.registerAccount(
            email: 'ropa@gmail.com', password: 'Password@1');
        expect(response, true);
      });
      test('should return false when statusCode!=200', () async {
        when(webClient.post(endpoint: '/users', body: {
          'emailAddress': 'ropa@gmail.com',
          'password': 'Password@1',
        })).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"success": true}', 201),
          ),
        );

        final response = await service.registerAccount(
            email: 'ropa@gmail.com', password: 'Password@1');
        expect(response, false);
      });

      test('should return false when success!=true', () async {
        when(webClient.post(endpoint: '/users', body: {
          'emailAddress': 'ropa@gmail.com',
          'password': 'Password@1',
        })).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"success": false}', 200),
          ),
        );

        final response = await service.registerAccount(
            email: 'ropa@gmail.com', password: 'Password@1');
        expect(response, false);
      });
    });
    group('signIn', () {
      test('should return jwtToken when success', () async {
        when(webClient.post(endpoint: '/users/login', body: {
          'emailAddress': 'ropa@gmail.com',
          'password': 'Password@1',
        })).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"jwt": "mytoken"}', 200),
          ),
        );

        final response = await service.signIn(
            email: 'ropa@gmail.com', password: 'Password@1');
        expect(response, 'mytoken');
      });
      test('should return false when statusCode!=200', () async {
        when(webClient.post(endpoint: '/users/login', body: {
          'emailAddress': 'ropa@gmail.com',
          'password': 'Password@1',
        })).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"jwt": "mytoken"}', 201),
          ),
        );

        final response = await service.signIn(
            email: 'ropa@gmail.com', password: 'Password@1');
        expect(response, null);
      });

      test('should return false when success!=true', () async {
        when(webClient.post(endpoint: '/users/login', body: {
          'emailAddress': 'ropa@gmail.com',
          'password': 'Password@1',
        })).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"jwt": null}', 200),
          ),
        );

        final response = await service.signIn(
            email: 'ropa@gmail.com', password: 'Password@1');
        expect(response, null);
      });
    });
  });
}
