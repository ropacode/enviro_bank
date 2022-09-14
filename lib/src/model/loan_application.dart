import 'package:enviro_bank/src/model/bank.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class LoanApplication extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? idNumber;
  final String? bankAccountNumber;
  final Bank? bank;
  final DateTime? collectionDate;

  String? get collectionDateFormatted {
    if (collectionDate == null) return null;
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(collectionDate!);
  }

  String? get bankName {
    switch(bank){
      case Bank.absa:
        return 'ABSA';
      case Bank.capitec:
        return 'Capitec';
      case Bank.fnb:
        return 'FNB';
      case Bank.investec:
        return 'Investec Limited';
      case Bank.nedbank:
        return 'Nedbank Limited';
      case Bank.standardBank:
        return 'Standard Bank';
      case Bank.vbs:
        return 'VBS';
      default:
        return null;
    }
  }

  final double? loanAmount;

  const LoanApplication({
    this.firstName,
    this.lastName,
    this.idNumber,
    this.bankAccountNumber,
    this.bank,
    this.collectionDate,
    this.loanAmount,
  });

  LoanApplication copyWith({
    String? firstName,
    String? lastName,
    String? idNumber,
    String? bankAccountNumber,
    Bank? bank,
    DateTime? collectionDate,
    double? loanAmount,
  }) {
    return LoanApplication(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      idNumber: idNumber ?? this.idNumber,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bank: bank ?? this.bank,
      collectionDate: collectionDate ?? this.collectionDate,
      loanAmount: loanAmount ?? this.loanAmount,
    );
  }

  bool isValid() {
    return firstNameValid() &&
        lastNameValid() &&
        idValid() &&
        bankAccountNumberValid() &&
        bankValid() &&
        loanAmountValid() &&
        collectionDateValid();
  }

  bool firstNameValid() {
    if (firstName?.isNotEmpty != true) return false;
    return RegExp(r'^[a-zA-Z]{1,}$').hasMatch(firstName!);
  }

  bool lastNameValid() {
    if (lastName?.isNotEmpty != true) return false;
    return RegExp(r'^[a-zA-Z]{1,}$').hasMatch(lastName!);
  }

  bool idValid() {
    if (idNumber?.isNotEmpty != true) return false;
    return RegExp(r'^[0-9]{13}$').hasMatch(idNumber!);
  }

  bool bankAccountNumberValid() {
    if (bankAccountNumber?.isNotEmpty != true) return false;
    return RegExp(r'^[0-9]{10}$').hasMatch(bankAccountNumber!);
  }

  bool bankValid() {
    return bank != null && bank != Bank.none;
  }

  bool loanAmountValid() {
    return loanAmount != null && loanAmount! > 0;
  }

  bool collectionDateValid() {
    return collectionDate != null && collectionDate!.isAfter(DateTime.now());
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        idNumber,
        bankAccountNumber,
        bank,
        collectionDate,
        loanAmount,
      ];
}
