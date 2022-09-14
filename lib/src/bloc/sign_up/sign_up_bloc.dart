import 'dart:async';

import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends AuthBloc {
  SignUpBloc({required AuthService service})
      : super(const SignUpInitialState(), service: service) {
    on<RegisterAccountEvent>(_onRegisterAccountEvent);
  }

  @override
  bool validPassword(String password) {
    return RegExp(
            r'''^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~])[A-Za-z\d!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]{8,}$''')
        .hasMatch(password);
  }

  FutureOr<void> _onRegisterAccountEvent(
    RegisterAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    final currState = state;
    if (currState is CredentialsChangedState) {
      if (!currState.canSubmit) {
        emit(
          SignUpFailedState(
            email: currState.email,
            password: currState.password,
          ),
        );
        return;
      }
      emit(
        RegisteringAccountState(
          email: currState.email,
          password: currState.password,
        ),
      );
      try {
        final registered = await service.registerAccount(
          email: currState.email,
          password: currState.password,
        );
        if (registered) {
          emit(
            AccountCreatedState(
              email: currState.email,
              password: currState.password,
            ),
          );
          await signIn(emit, currState);
        } else {
          emit(
            SignUpFailedState(
              email: currState.email,
              password: currState.password,
            ),
          );
        }
      } catch (e) {
        emit(
          SignUpFailedState(
            email: currState.email,
            password: currState.password,
          ),
        );
      }
    } else {
      emit(const SignUpFailedState(email: '', password: ''));
    }
  }
}
