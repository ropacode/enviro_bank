import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:enviro_bank/ui/auth/email_widget.dart';
import 'package:enviro_bank/ui/auth/password_widget.dart';
import 'package:enviro_bank/ui/route_names.dart';
import 'package:enviro_bank/ui/sign_in/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInFormWidget extends StatefulWidget {
  final SignInBloc bloc;

  const SignInFormWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, AuthState>(
      listenWhen: (prev, next) => next is CredentialsChangedState,
      listener: (context, state) {
        if (state is CredentialsChangedState) {
          _formKey.currentState?.validate();
        }
      },
      child: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  S.of(context).welcomeMessage,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              EmailWidget(
                controller: _emailController,
                bloc: widget.bloc,
              ),
              const SizedBox(
                height: 8,
              ),
              PasswordWidget(
                controller: _passwordController,
                bloc: widget.bloc,
                errorMessage: S.of(context).passwordMissing,
                validatePassword: false,
              ),
              const SizedBox(
                height: 8,
              ),
              SignInButton(
                bloc: widget.bloc,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(S.of(context).noHaveAccount),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).replace(RouteNames.signUp);
                    },
                    child: Text(S.of(context).signUpBtn),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
