import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/model/bank.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';

class BankSelectionWidget extends StatelessWidget {
  final HomeBloc bloc;

  const BankSelectionWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Bank>(
      value: Bank.none,
      decoration: InputDecoration(
        hintText: S.of(context).selectBank,
        labelText: S.of(context).selectBank,
      ),
      items: [
        Bank.none,
        Bank.absa,
        Bank.capitec,
        Bank.fnb,
        Bank.investec,
        Bank.nedbank,
        Bank.standardBank,
        Bank.vbs,
      ]
          .map(
            (bank) => DropdownMenuItem<Bank>(
              value: bank,
              child: Text(
                bankName(
                  context,
                  bank,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (bank) {
        if (bank != null) {
          bloc.add(ChangeBankEvent(bank: bank));
        }
      },
      validator: (value) {
        if (!LoanApplication(
          bank: value,
        ).bankValid()) {
          return S.of(context).bankMissing;
        }
        return null;
      },
    );
  }

  String bankName(BuildContext context, Bank bank) {
    switch (bank) {
      case Bank.none:
        return S.of(context).selectBank;
      case Bank.absa:
        return S.of(context).absa;
      case Bank.capitec:
        return S.of(context).capitec;
      case Bank.fnb:
        return S.of(context).fnb;
      case Bank.investec:
        return S.of(context).investec;
      case Bank.nedbank:
        return S.of(context).nedbank;
      case Bank.standardBank:
        return S.of(context).standardBank;
      case Bank.vbs:
        return S.of(context).vbs;
    }
  }
}
