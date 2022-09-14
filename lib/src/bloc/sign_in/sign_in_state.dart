part of 'sign_in_bloc.dart';

abstract class SignInState extends AuthState {
  const SignInState();
}

class SignInInitialState extends SignInState {
  @override
  List<Object> get props => [];

  const SignInInitialState();
}

class SigningInState extends CredentialsState {
  const SigningInState({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );
}
