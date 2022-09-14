part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends AuthEvent {
  const SignUpEvent();
}


class RegisterAccountEvent extends SignUpEvent {

  @override
  List<Object> get props => [];

  const RegisterAccountEvent();
}