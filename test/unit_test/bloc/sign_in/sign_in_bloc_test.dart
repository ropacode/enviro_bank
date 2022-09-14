import 'package:bloc_test/bloc_test.dart';
import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:enviro_bank/src/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  group('SignInBloc', () {
    late SignInBloc bloc;
    late AuthService service;
    setUp(() {
      service = MockAuthService();
      bloc = SignInBloc(service: service);
    });

    test('should emit SignInInitialState as the correct initial state', () {
      expect(bloc.state, const SignInInitialState());
    });

    group('Changing credentials', () {
      blocTest<SignInBloc, AuthState>(
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

      blocTest<SignInBloc, AuthState>(
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

      blocTest<SignInBloc, AuthState>(
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
      blocTest<SignInBloc, AuthState>(
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

      blocTest<SignInBloc, AuthState>(
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

    group('Signing in', () {
      group('Fail responses', () {
        blocTest<SignInBloc, AuthState>(
          'should emit SignInFailedState if credentials are missing',
          build: () => bloc,
          act: (bloc) {
            bloc.add(const SignInEvent());
          },
          expect: () => <AuthState>[
            const SignInFailedState(
              email: '',
              password: '',
            ),
          ],
        );


        blocTest<SignInBloc, AuthState>(
          'should emit SignInFailedState if registerAccount fails',
          build: () {
            when(
              service.signIn(
                email: 'ropa@gmail.com',
                password: 'passworD#1',
              ),
            ).thenAnswer((realInvocation) => Future.value(null));
            return bloc;
          },
          act: (bloc) {
            bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
            bloc.add(const PasswordChangedEvent(password: 'passworD#1'));
            bloc.add(const SignInEvent());
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
            const SigningInState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const SignInFailedState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
          ],
        );
      });
      group('Success responses', () {
        blocTest<SignInBloc, AuthState>(
          'should emit AccountCreatedState if credentials are valid and signup works',
          build: () {
            when(
              service.signIn(
                email: 'ropa@gmail.com',
                password: 'passworD#1',
              ),
            ).thenAnswer((realInvocation) => Future.value('blahblah'));
            return bloc;
          },
          act: (bloc) {
            bloc.add(const EmailChangedEvent(email: 'ropa@gmail.com'));
            bloc.add(const PasswordChangedEvent(password: 'passworD#1'));
            bloc.add(const SignInEvent());
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
            const SigningInState(
              email: 'ropa@gmail.com',
              password: 'passworD#1',
            ),
            const SignInSucceededState(jwtToken: 'blahblah'),
          ],
        );
      });
    });
  });
}
