import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/model/loan_application.dart';
import 'package:flutter/material.dart';

class FirstNameWidget extends StatelessWidget {
  final TextEditingController controller;

  const FirstNameWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!LoanApplication(
              firstName: value?.trim(),
            ).firstNameValid()) {
          return S.of(context).firstNameMissing;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).firstName,
        labelText: S.of(context).firstName,
      ),
    );
  }
}
