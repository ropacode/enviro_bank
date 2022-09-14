import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';

class IdNumberWidget extends StatelessWidget {
  final TextEditingController controller;

  const IdNumberWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!LoanApplication(
              idNumber: value?.trim(),
            ).idValid()) {
          return S.of(context).idNumberMissing;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).idNumber,
        labelText: S.of(context).idNumber,
      ),
    );
  }
}
