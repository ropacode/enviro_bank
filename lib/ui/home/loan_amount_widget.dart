import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';

class LoanAmountWidget extends StatelessWidget {
  final TextEditingController controller;

  const LoanAmountWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!_amountValid(value)) {
          return S.of(context).loanAmountMissing;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).loanAmount,
        labelText: S.of(context).loanAmount,
      ),
    );
  }

  bool _amountValid(String? value) {
    if (value == null) return false;
    var amount = double.tryParse(value.trim());
    return LoanApplication(loanAmount: amount).loanAmountValid();
  }
}
