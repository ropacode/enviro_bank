import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/model/bank.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'auth_service_test.mocks.dart';

@GenerateMocks([WebClient])
void main() {
  group('HomeService', () {
    late WebClient webClient;
    late HomeService service;
    late LoanApplication application;
    late Map<String, dynamic> body;
    setUp(() {
      webClient = MockWebClient();
      service = HomeService(webClient: webClient);
      application = LoanApplication(
        firstName: 'Ropafadzo',
        lastName: 'Magwali',
        idNumber: '9224321234567',
        bankAccountNumber: '1234543212',
        bank: Bank.absa,
        collectionDate: DateTime(2022, 12, 1),
        loanAmount: 10.0,
      );
      body = {
        "amount": application.loanAmount,
        "bankAccount": {
          "accountNumber": int.tryParse(application.bankAccountNumber!),
          "bankName": application.bankName,
          "branchCode": 250060
        },
        "collectionDate": application.collectionDateFormatted,
        "firstName": application.firstName,
        "idNumber": int.tryParse(application.idNumber!),
        "lastName": application.lastName
      };
    });
    group('submitApplication', () {
      test('should return true when approved', () async {
        when(
          webClient.post(
            endpoint: '/loans',
            body: body,
          ),
        ).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"approved": true}', 200),
          ),
        );

        final response = await service.submitApplication(application);
        expect(response, true);
      });
      test('should return false when not approved', () async {
        when(
          webClient.post(
            endpoint: '/loans',
            body: body,
          ),
        ).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"approved": false}', 200),
          ),
        );

        final response = await service.submitApplication(application);
        expect(response, false);
      });
      test('should return false when statusCode not 200', () async {
        when(
          webClient.post(
            endpoint: '/loans',
            body: body,
          ),
        ).thenAnswer(
          (realInvocation) => Future.value(
            http.Response('{"approved": true}', 401),
          ),
        );

        final response = await service.submitApplication(application);
        expect(response, false);
      });
    });
  });
}
