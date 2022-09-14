import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:enviro_bank/ui/route_names.dart';
import 'package:enviro_bank/ui/sign_in/signing_in_widget.dart';
import 'package:enviro_bank/ui/sign_up/register_form_widget.dart';
import 'package:enviro_bank/ui/sign_up/registering_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        child: BlocConsumer<SignUpBloc, AuthState>(
          listenWhen: (prev, next) =>
              next is SignUpFailedState ||
              next is SignInFailedState ||
              next is AccountCreatedState ||
              next is SignInSucceededState,
          listener: (context, state) {
            if (state is SignUpFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).failedToSignUpMessage),
                ),
              );
            } else if (state is SignInFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).failedToSignInMessage),
                ),
              );
              GoRouter.of(context).replace(RouteNames.signIn);
            } else if (state is AccountCreatedState) {
              // GoRouter.of(context).replace(RouteNames.signIn);
            } else if (state is SignInSucceededState) {
              GoRouter.of(context).replace(RouteNames.home);
            }
          },
          buildWhen: (prev, next) =>
              next is RegisteringAccountState ||
              next is SignUpFailedState ||
              next is AccountCreatedState ||
              next is SignUpInitialState,
          builder: (context, state) {
            if (state is RegisteringAccountState) {
              return const RegisteringAccountWidget();
            }
            if (state is AccountCreatedState) {
              return const SigningInWidget();
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
