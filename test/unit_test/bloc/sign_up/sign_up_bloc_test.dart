import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:enviro_bank/src/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_bloc_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  group('SignUpBloc', () {
    late SignUpBloc bloc;
    late AuthService service;
    setUp(() {
      service = MockAuthService();
      bloc = SignUpBloc(service: service);
    });

    test('should emit SignUpInitState as correct initial state', () {
      expect(bloc.state, const SignUpInitialState());
    });

    group('Changing credentials', () {
      blocTest<SignUpBloc, AuthState>(
        'should emit CredentialsChangedState with canSubmit=false when no password',
        build: () {
          return bloc;
        },
        act: (bloc) {
          bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
        },
        expect: () => <AuthState>[
          const CredentialsChangedState(
            canSubmit: false,
            email: 'ropa@gmail.com',
            password: '',
          ),
        ],
      );

      blocTest<SignUpBloc, AuthState>(
        'should emit CredentialsChangedState with canSubmit=false when password is invalid',
        build: () => bloc,
        act: (bloc) {
          bloc.add(const PasswordChangedEvent(password: 'password'));
        },
        expect: () => <AuthState>[
          const CredentialsChangedState(
            canSubmit: false,
            email: '',
            password: 'password',
          ),
        ],
      );

      blocTest<SignUpBloc, AuthState>(
        'should emit CredentialsChangedState with canSubmit=true when password is valid',
        build: () => bloc,
        act: (bloc) {
          bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
          bloc.add(const PasswordChangedEvent(password: 'passworD#1'));
        },
        expect: () => <AuthState>[
          const CredentialsChangedState(
            canSubmit: false,
            email: 'ropa@gmail.com',
            password: '',
          ),
          const CredentialsChangedState(
            canSubmit: true,
            email: 'ropa@gmail.com',
            password: 'passworD#1',
          ),
        ],
      );
      blocTest<SignUpBloc, AuthState>(
        'should emit CredentialsChangedState with canSubmit=true when password is valid',
        build: () => bloc,
        act: (bloc) {
          bloc.add(const PasswordChangedEvent(password: 'passworX#1'));
          bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
        },
        expect: () => <AuthState>[
          const CredentialsChangedState(
            canSubmit: false,
            email: '',
            password: 'passworX#1',
          ),
          const CredentialsChangedState(
            canSubmit: true,
            email: 'ropa@gmail.com',
            password: 'passworX#1',
          ),
        ],
      );

      blocTest<SignUpBloc, AuthState>(
        'should emit CredentialsChangedState with canSubmit=false when password is valid and email missing',
        build: () => bloc,
        act: (bloc) {
          bloc.add(const EmailChangedEvent(email: ''));
          bloc.add(const PasswordChangedEvent(password: 'passworD#1'));
        },
        expect: () => <AuthState>[
          const CredentialsChangedState(
            canSubmit: false,
            email: '',
            password: '',
          ),
          const CredentialsChangedState(
            canSubmit: false,
            email: '',
            password: 'passworD#1',
          ),
        ],
      );
    });

    group('Register account', () {
      group('Fail responses', () {
        blocTest<SignUpBloc, AuthState>(
          'should emit SignUpFailedState if credentials are missing',
          build: () => bloc,
          act: (bloc) {
            bloc.add(const RegisterAccountEvent());
          },
          expect: () => <AuthState>[
            const SignUpFailedState(
              email: '',
              password: '',
            ),
          ],
        );
        blocTest<SignUpBloc, AuthState>(
          'should emit SignUpFailedState if credentials are invalid',
          build: () => bloc,
          act: (bloc) {
            bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
            bloc.add(const PasswordChangedEvent(password: 'passworD1'));
            bloc.add(const RegisterAccountEvent());
          },
          expect: () => <AuthState>[
            const CredentialsChangedState(
              canSubmit: false,
              email: 'ropa@gmail.com',
              password: '',
            ),
            const CredentialsChangedState(
              canSubmit: false,
              email: 'ropa@gmail.com',
              password: 'passworD1',
            ),
            const SignUpFailedState(
              email: 'ropa@gmail.com',
              password: 'passworD1',
            ),
          ],
        );

        blocTest<SignUpBloc, AuthState>(
          'should emit SignUpFailedState if registerAccount fails',
          build: () {
            when(
              service.registerAccount(
                email: 'ropa@gmail.com',
                password: 'passworD#1',
              ),
            ).thenAnswer((realInvocation) => Future.value(false));
            return bloc;
          },
          act: (bloc) {
            bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
            bloc.add(const PasswordChangedEvent(password: 'passworD#1'));
            bloc.add(const RegisterAccountEvent());
          },
          expect: () => <AuthState>[
            const CredentialsChangedState(
              canSubmit: false,
              email: 'ropa@gmail.com',
              password: '',
            ),
            const CredentialsChangedState(
              canSubmit: true,
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const RegisteringAccountState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const SignUpFailedState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
          ],
        );
      });
      group('Success responses', () {
        blocTest<SignUpBloc, AuthState>(
          'should emit AccountCreatedState if credentials are valid and signup works',
          build: () {
            when(
              service.registerAccount(
                email: 'ropa@gmail.com',
                password: 'passworD#1',
              ),
            ).thenAnswer((realInvocation) => Future.value(true));
            when(
              service.signIn(
                email: 'ropa@gmail.com',
                password: 'passworD#1',
              ),
            ).thenAnswer((realInvocation) => Future.value('mytoken'));
            return bloc;
          },
          act: (bloc) {
            bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
            bloc.add(const PasswordChangedEvent(password: 'passworD#1'));
            bloc.add(const RegisterAccountEvent());
          },
          expect: () => <AuthState>[
            const CredentialsChangedState(
              canSubmit: false,
              email: 'ropa@gmail.com',
              password: '',
            ),
            const CredentialsChangedState(
              canSubmit: true,
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const RegisteringAccountState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const AccountCreatedState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const SigningInState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const SignInSucceededState(
              jwtToken: 'mytoken',
            ),
          ],
        );
      });
    });
  });
}
