part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  const AuthState();
}


abstract class CredentialsState extends AuthState {
  final String email;
  final String password;

  const CredentialsState({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class CredentialsChangedState extends CredentialsState {
  final bool canSubmit;

  const CredentialsChangedState({
    this.canSubmit = false,
    String email = '',
    String password = '',
  }) : super(
    email: email,
    password: password,
  );

  @override
  List<Object> get props => [
    ...super.props,
    canSubmit,
  ];

  CredentialsChangedState copyWith({
    bool? canSubmit,
    String? email,
    String? password,
  }) {
    return CredentialsChangedState(
      canSubmit: canSubmit ?? this.canSubmit,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class SignInFailedState extends CredentialsState {
  const SignInFailedState({
    required String email,
    required String password,
  }) : super(
    email: email,
    password: password,
  );
}

class SignInSucceededState extends AuthState {
  final String jwtToken;

  const SignInSucceededState({
    required this.jwtToken,
  });

  @override
  List<Object> get props => [jwtToken];
}
