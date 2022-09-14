part of 'sign_up_bloc.dart';

abstract class SignUpState extends AuthState {
  const SignUpState();
}

class SignUpInitialState extends SignUpState {
  const SignUpInitialState();

  @override
  List<Object?> get props => [];
}

class RegisteringAccountState extends CredentialsState {
  const RegisteringAccountState({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );
}

class AccountCreatedState extends CredentialsState {
  const AccountCreatedState({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );
}

class SignUpFailedState extends CredentialsState {
  const SignUpFailedState({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );
}

