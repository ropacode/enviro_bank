import 'dart:async';
import 'dart:convert';

import 'package:enviro_bank/src/config.dart';
import 'package:enviro_bank/src/model/bank.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'package:enviro_bank/src/service/home_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _service;

  HomeBloc({
    required HomeService service,
  })  : _service = service,
        super(HomeInitialState()) {
    on<SignOutEvent>(_onSignOutEvent);
    on<SubmitApplicationEvent>(_onSubmitApplicationEvent);
    on<BeginApplicationEvent>(_onBeginApplicationEvent);
    on<ChangeBankEvent>(_onChangeBankEvent);
    on<ChangedCollectionDateEvent>(_onChangedCollectionDateEvent);
  }

  FutureOr<void> _onChangedCollectionDateEvent(
      ChangedCollectionDateEvent event, Emitter<HomeState> emit) async {
    emit(
      BankOrDateChangedState(
        bank: state.selectedBank,
        collectionDate: event.date,
      ),
    );
  }

  FutureOr<void> _onChangeBankEvent(
      ChangeBankEvent event, Emitter<HomeState> emit) async {
    emit(
      BankOrDateChangedState(
        bank: event.bank,
        collectionDate: state.collectionDate,
      ),
    );
  }

  FutureOr<void> _onBeginApplicationEvent(
      BeginApplicationEvent event, Emitter<HomeState> emit) async {
    emit(HomeBeginApplyState());
  }

  FutureOr<void> _onSubmitApplicationEvent(
      SubmitApplicationEvent event, Emitter<HomeState> emit) async {
    final application = event.application.copyWith(
      bank: state.selectedBank,
      collectionDate: state.collectionDate,
    );
    if (!application.isValid()) {
      emit(
        InvalidApplicationState(
          selectedBank: state.selectedBank,
        ),
      );
      return;
    }
    emit(
      SubmittingApplicationState(
        application: application,
      ),
    );
    try {
      final approved = await _service.submitApplication(application);
      if (approved) {
        emit(
          ApplicationApprovedState(
            application: application,
          ),
        );
      } else {
        emit(
          ApplicationFailedState(
            application: application,
          ),
        );
      }
    } catch (e) {
      emit(
        ApplicationFailedState(
          application: application,
        ),
      );
    }
  }

  FutureOr<void> _onSignOutEvent(
      SignOutEvent event, Emitter<HomeState> emit) async {
    emit(const SigningOutState());
    await _service.signOut();
    emit(const SignedOutState());
  }
}
