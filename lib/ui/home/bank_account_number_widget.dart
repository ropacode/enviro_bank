import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';

class BankAccountNumberWidget extends StatelessWidget {
  final TextEditingController controller;

  const BankAccountNumberWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!LoanApplication(
          bankAccountNumber: value?.trim(),
        ).bankAccountNumberValid()) {
          return S.of(context).bankAccountNumberMissing;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).bankAccountNumber,
        labelText: S.of(context).bankAccountNumber,
      ),
    );
  }
}
