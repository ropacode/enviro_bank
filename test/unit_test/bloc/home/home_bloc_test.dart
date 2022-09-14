import 'package:bloc_test/bloc_test.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/model/bank.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeService])
void main() {
  group('HomeBloc', () {
    late HomeBloc bloc;
    late HomeService service;
    setUp(() {
      service = MockHomeService();
      bloc = HomeBloc(service: service);
    });

    test('should emit as the correct initial state', () {
      expect(bloc.state, HomeInitialState());
    });

    blocTest(
      'should emit SignedOutState',
      build: () {
        when(service.signOut()).thenAnswer((realInvocation) => Future.value());
        return bloc;
      },
      act: (bloc) {
        bloc.add(const SignOutEvent());
      },
      expect: () => <HomeState>[
        const SigningOutState(),
        const SignedOutState(),
      ],
    );

    group('SubmitApplicationEvent', () {
      group('Invalid application', () {
        late LoanApplication application;
        setUp(() {
          application = LoanApplication(
            firstName: 'Ropafadzo',
            lastName: 'Magwali',
            idNumber: '9224321234567',
            bankAccountNumber: '1234543212',
            bank: Bank.absa,
            collectionDate: DateTime(2022, 12, 1),
            loanAmount: 10.0,
          );
        });
        blocTest(
          'when invalid firstName should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  firstName: 'Ropa\$',
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            InvalidApplicationState(
              collectionDate: application.collectionDate,
              selectedBank: application.bank ?? Bank.none,
            ),
          ],
        );
        blocTest(
          'when invalid lastName should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  lastName: 'Ropa\$',
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            InvalidApplicationState(
              collectionDate: application.collectionDate,
              selectedBank: application.bank ?? Bank.none,
            ),
          ],
        );
        blocTest(
          'when invalid idNumber should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  idNumber: 'Rop131231a122',
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            InvalidApplicationState(
              collectionDate: application.collectionDate,
              selectedBank: application.bank ?? Bank.none,
            ),
          ],
        );
        blocTest(
          'when invalid bankAccountNumber should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  bankAccountNumber: '131231a122',
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            InvalidApplicationState(
              collectionDate: application.collectionDate,
              selectedBank: application.bank ?? Bank.none,
            ),
          ],
        );
        blocTest(
          'when invalid bank should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(const ChangeBankEvent(bank: Bank.none));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  bank: Bank.none,
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            const BankOrDateChangedState(bank: Bank.none, collectionDate: null),
            InvalidApplicationState(
              collectionDate: application.collectionDate,
              selectedBank: Bank.none,
            ),
          ],
        );
        blocTest(
          'when invalid loanAmount should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  loanAmount: -100,
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            InvalidApplicationState(
              collectionDate: application.collectionDate,
              selectedBank: application.bank ?? Bank.none,
            ),
          ],
        );
        blocTest(
          'when invalid collectionDate should emit InvalidApplicationState',
          build: () {
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application.copyWith(
                  collectionDate: DateTime(2022, 09, 13),
                ),
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            InvalidApplicationState(
              collectionDate: DateTime(2022, 09, 13),
              selectedBank: application.bank ?? Bank.none,
            ),
          ],
        );
      });
      group('Valid application', () {
        late LoanApplication application;
        setUp(() {
          application = LoanApplication(
            firstName: 'Ropafadzo',
            lastName: 'Magwali',
            idNumber: '9224321234567',
            bankAccountNumber: '1234543212',
            bank: Bank.absa,
            collectionDate: DateTime(2022, 12, 1),
            loanAmount: 10.0,
          );
        });
        blocTest(
          'should emit ApplicationApprovedState when approved',
          build: () {
            when(service.submitApplication(application)).thenAnswer(
              (realInvocation) => Future.value(true),
            );
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application,
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            SubmittingApplicationState(
              application: application,
            ),
            ApplicationApprovedState(
              application: application,
            ),
          ],
        );
        blocTest(
          'should emit ApplicationApprovedState when not approved',
          build: () {
            when(service.submitApplication(application)).thenAnswer(
              (realInvocation) => Future.value(false),
            );
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application,
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            SubmittingApplicationState(
              application: application,
            ),
            ApplicationFailedState(
              application: application,
            ),
          ],
        );
        blocTest(
          'should emit ApplicationFailedState when error thrown',
          build: () {
            when(service.submitApplication(application))
                .thenThrow(UnauthorizedException());
            return bloc;
          },
          act: (bloc) {
            bloc.add(ChangeBankEvent(bank: application.bank!));
            bloc.add(
              SubmitApplicationEvent(
                application: application,
              ),
            );
          },
          expect: () => <HomeState>[
            BankOrDateChangedState(
                bank: application.bank!, collectionDate: null),
            SubmittingApplicationState(
              application: application,
            ),
            ApplicationFailedState(
              application: application,
            ),
          ],
        );
      });
    });
  });
}
