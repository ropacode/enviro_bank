import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController controller;
  final SignUpBloc bloc;

  const PasswordWidget({
    Key? key,
    required this.controller,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text) {
        bloc.add(PasswordChangedEvent(password: text));
      },
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty || !bloc.validPassword(value)) {
          return S.of(context).passwordRequirement;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).passwordHint,
        labelText: S.of(context).passwordLabel,
        errorMaxLines: 3,
      ),
    );
  }
}
