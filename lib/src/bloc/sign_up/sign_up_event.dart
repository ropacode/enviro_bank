part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class EmailChangedEvent extends SignUpEvent {
  final String email;

  const EmailChangedEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];

}

class PasswordChangedEvent extends SignUpEvent {
  final String password;

  const PasswordChangedEvent({
    required this.password,
  });

  @override
  List<Object> get props => [password];

}

class RegisterAccountEvent extends SignUpEvent {

  @override
  List<Object> get props => [];

  const RegisterAccountEvent();
}