import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:enviro_bank/ui/route_names.dart';
import 'package:enviro_bank/ui/sign_in/sign_in_form_widget.dart';
import 'package:enviro_bank/ui/sign_in/signing_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: BlocConsumer<SignInBloc, AuthState>(
          listenWhen: (prev, next) =>
              next is SignInFailedState || next is SignInSucceededState,
          listener: (context, state) {
            if (state is SignInFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).failedToSignInMessage),
                ),
              );
            } else if (state is SignInSucceededState) {
              GoRouter.of(context).replace(
                RouteNames.home,
                extra: {
                  'token': state.jwtToken,
                },
              );
            }
          },
          buildWhen: (prev, next) =>
              next is SigningInState ||
              next is SignInFailedState ||
              next is SignInInitialState,
          builder: (context, state) {
            if (state is SigningInState) {
              return const SigningInWidget();
            }
            return SignInFormWidget(
              bloc: context.read<SignInBloc>(),
            );
          },
        ),
      ),
    );
  }
}
