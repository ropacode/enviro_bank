import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';

class LastNameWidget extends StatelessWidget {
  final TextEditingController controller;

  const LastNameWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!LoanApplication(
              lastName: value?.trim(),
            ).lastNameValid()) {
          return S.of(context).lastNameMissing;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).lastName,
        labelText: S.of(context).lastName,
      ),
    );
  }
}
