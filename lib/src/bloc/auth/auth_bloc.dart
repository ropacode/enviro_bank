import 'dart:async';

import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:enviro_bank/src/service/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

abstract class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @protected
  final AuthService service;

  AuthBloc(
    super.initialState, {
    required this.service,
  }) {
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<SignInEvent>(_onSignInEvent);
  }

  FutureOr<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final currState = state;
    if (currState is CredentialsChangedState) {
      if (!currState.canSubmit) {
        emit(
          SignInFailedState(
            email: currState.email,
            password: currState.password,
          ),
        );
        return;
      }
      await signIn(emit, currState);
    } else {
      emit(const SignInFailedState(email: '', password: ''));
    }
  }

  @protected
  Future<void> signIn(
      Emitter<AuthState> emit, CredentialsState currState) async {
    emit(
      SigningInState(
        email: currState.email,
        password: currState.password,
      ),
    );
    try {
      final jwtToken = await service.signIn(
        email: currState.email,
        password: currState.password,
      );
      if (jwtToken != null) {
        emit(
          SignInSucceededState(
            jwtToken: jwtToken,
          ),
        );
      } else {
        emit(
          SignInFailedState(
            email: currState.email,
            password: currState.password,
          ),
        );
      }
    } catch (e) {
      emit(
        SignInFailedState(
          email: currState.email,
          password: currState.password,
        ),
      );
    }
  }

  FutureOr<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<AuthState> emit,
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

  bool validPassword(String password);

  FutureOr<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final currState = state;
    if (currState is CredentialsChangedState) {
      emit(
        currState.copyWith(
          email: event.email,
          canSubmit:
              validPassword(currState.password) && event.email.isNotEmpty,
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
