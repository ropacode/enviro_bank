import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:enviro_bank/ui/sign_up/email_widget.dart';
import 'package:enviro_bank/ui/sign_up/password_widget.dart';
import 'package:enviro_bank/ui/sign_up/register_form_widget.dart';
import 'package:enviro_bank/ui/sign_up/registering_account_widget.dart';
import 'package:enviro_bank/ui/sign_up/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is AccountCreatedState) {

            } else if (state is SignUpFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).failedToSignUpMessage),
                ),
              );
            }
          },
          buildWhen: (prev, next) =>
              next is RegisteringAccountState ||
              next is SignUpFailedState ||
              next is SignUpInitState,
          builder: (context, state) {
            if (state is RegisteringAccountState) {
              return const RegisteringAccountWidget();
            }
            return RegisterFormWidget(
              bloc: context.read<SignUpBloc>(),
            );
          },
        ),
      ),
    );
  }
}
