part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final Bank selectedBank;
  final DateTime? collectionDate;

  const HomeState({
    this.selectedBank = Bank.none,
    this.collectionDate,
  });

  @override
  List<Object?> get props => [selectedBank, collectionDate];
}

class HomeInitialState extends HomeState {}

class HomeBeginApplyState extends HomeState {}

class SignedOutState extends HomeState {
  const SignedOutState();
}

class SigningOutState extends HomeState {
  const SigningOutState();
}

class InvalidApplicationState extends HomeState {
  const InvalidApplicationState({
    Bank selectedBank = Bank.none,
  }) : super(selectedBank: selectedBank);
}

class ApplicationState extends HomeState {
  final LoanApplication application;

  ApplicationState({
    required this.application,
  }) : super(
          selectedBank: application.bank ?? Bank.none,
          collectionDate: application.collectionDate,
        );

  @override
  List<Object?> get props => [
        selectedBank,
        application,
        collectionDate,
      ];
}

class BankOrDateChangedState extends HomeState {
  const BankOrDateChangedState({
    required Bank bank,
    required DateTime? collectionDate,
  }) : super(
          selectedBank: bank,
          collectionDate: collectionDate,
        );
}

class SubmittingApplicationState extends ApplicationState {
  SubmittingApplicationState({
    required LoanApplication application,
  }) : super(application: application);
}

class ApplicationFailedState extends ApplicationState {
  ApplicationFailedState({
    required LoanApplication application,
  }) : super(application: application);
}

class ApplicationApprovedState extends ApplicationState {
  ApplicationApprovedState({
    required LoanApplication application,
  }) : super(application: application);
}
