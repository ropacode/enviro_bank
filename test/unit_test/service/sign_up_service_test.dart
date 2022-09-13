import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'sign_up_service_test.mocks.dart';

@GenerateMocks([WebClient])
void main() {
  group('SignUpService', () {
    late WebClient webClient;
    late SignUpService service;
    setUp(() {
      webClient = MockWebClient();
      service = SignUpService(webClient: webClient);
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
  });
}
