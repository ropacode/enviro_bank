import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  final SignUpBloc bloc;

  const SignUpButton({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is CredentialsChangedState && state.canSubmit
              ? () {
                  bloc.add(const RegisterAccountEvent());
                }
              : null,
          child: Text(S.of(context).signUpBtn),
        );
      },
    );
  }
}
