import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController controller;
  final AuthBloc bloc;
  final bool validatePassword;
  final String? errorMessage;
  const PasswordWidget({
    Key? key,
    required this.controller,
    required this.bloc,
    this.errorMessage,
    this.validatePassword = true,
  }) : super(key: key);

  bool _validPassword(String value){
    return !validatePassword || bloc.validPassword(value);
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text) {
        bloc.add(PasswordChangedEvent(password: text));
      },
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty || !_validPassword(value)) {
          return errorMessage ?? S.of(context).passwordRequirement;
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
