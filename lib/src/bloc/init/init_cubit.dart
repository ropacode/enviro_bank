import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'package:enviro_bank/src/service/init_service.dart';

part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  final InitService service;

  InitCubit({
    required this.service,
  }) : super(InitInitialState());

  FutureOr<void> initialize() async {
    //slight delay for better showing of splash screen
    await Future.delayed(const Duration(milliseconds: 500));
    final jwtToken = await service.getJwtToken();
    if (jwtToken != null) {
      emit(SignedInState(jwtToken: jwtToken));
    } else {
      emit(const SignedOutState());
    }
  }
}
