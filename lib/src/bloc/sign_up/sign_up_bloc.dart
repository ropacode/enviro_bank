import 'dart:async';
import 'dart:convert';

import 'package:enviro_bank/src/service/web_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'package:enviro_bank/src/service/sign_up_service.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpService _service;

  SignUpBloc({required SignUpService service})
      : _service = service,
        super(
          const SignUpInitState(),
        ) {
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<RegisterAccountEvent>(_onRegisterAccountEvent);
  }

  FutureOr<void> _onRegisterAccountEvent(
    RegisterAccountEvent event,
    Emitter<SignUpState> emit,
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
        final registered = await _service.registerAccount(
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

  FutureOr<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final currState = state;
    if (currState is CredentialsChangedState) {
      emit(
        currState.copyWith(
          password: event.password,
          canSubmit:
              currState.email.isNotEmpty && validPassword(event.password),
        ),
      );
    } else {
      emit(
        CredentialsChangedState(
          password: event.password,
        ),
      );
    }
  }

  bool validPassword(String password) {
    return RegExp(
            r'''^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~])[A-Za-z\d!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]{8,}$''')
        .hasMatch(password);
  }

  FutureOr<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<SignUpState> emit,
  ) {
    final currState = state;
    if (currState is CredentialsChangedState) {
      emit(
        currState.copyWith(
          email: event.email,
          canSubmit: validPassword(currState.password) && event.email.isNotEmpty,
        ),
      );
    } else {
      emit(
        CredentialsChangedState(
          email: event.email,
        ),
      );
    }
  }
}
