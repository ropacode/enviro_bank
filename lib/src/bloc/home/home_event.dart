part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SignOutEvent extends HomeEvent {
  const SignOutEvent();

  @override
  List<Object> get props => [];
}

class SubmitApplicationEvent extends HomeEvent {
  final LoanApplication application;

  const SubmitApplicationEvent({
    required this.application,
  });

  @override
  List<Object> get props => [application];
}

class BeginApplicationEvent extends HomeEvent {
  const BeginApplicationEvent();

  @override
  List<Object> get props => [];
}

class ChangeBankEvent extends HomeEvent {
  final Bank bank;

  @override
  List<Object> get props => [bank];

  const ChangeBankEvent({
    required this.bank,
  });
}

class ChangedCollectionDateEvent extends HomeEvent {
  final DateTime date;

  @override
  List<Object> get props => [date];

  const ChangedCollectionDateEvent({
    required this.date,
  });
}
