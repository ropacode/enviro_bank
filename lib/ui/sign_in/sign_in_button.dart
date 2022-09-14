import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInButton extends StatelessWidget {
  final SignInBloc bloc;

  const SignInButton({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is CredentialsChangedState && state.canSubmit
              ? () {
                  bloc.add(const SignInEvent());
                }
              : null,
          child: Text(S.of(context).signInBtn),
        );
      },
    );
  }
}
