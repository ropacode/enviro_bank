import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  final TextEditingController controller;
  final SignUpBloc bloc;

  const EmailWidget({
    Key? key,
    required this.controller,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text) {
        bloc.add(EmailChangedEvent(email: text.trim()));
      },
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return S.of(context).emailMissing;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: S.of(context).emailHint,
        labelText: S.of(context).emailLabel,
      ),
    );
  }
}
