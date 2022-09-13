part of 'init_cubit.dart';

abstract class InitState extends Equatable {
  const InitState();
}

class InitInitialState extends InitState {
  @override
  List<Object> get props => [];
}

class SignedInState extends InitState {
  final String jwtToken;

  const SignedInState({
    required this.jwtToken,
  });

  @override
  List<Object> get props => [jwtToken];
}

class SignedOutState extends InitState {

  @override
  List<Object> get props => [];

  const SignedOutState();
}
