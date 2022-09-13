part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitState extends SignUpState {
  const SignUpInitState();

  @override
  List<Object?> get props => [];
}

abstract class CredentialsState extends SignUpState {
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
