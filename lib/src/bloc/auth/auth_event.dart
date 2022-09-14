part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class EmailChangedEvent extends AuthEvent {
  final String email;

  const EmailChangedEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends AuthEvent {
  final String password;

  const PasswordChangedEvent({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}
class SignInEvent extends AuthEvent {
  @override
  List<Object> get props => [];

  const SignInEvent();
}
