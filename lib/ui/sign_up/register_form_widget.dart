import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:enviro_bank/ui/sign_up/email_widget.dart';
import 'package:enviro_bank/ui/sign_up/password_widget.dart';
import 'package:enviro_bank/ui/sign_up/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormWidget extends StatefulWidget {
  final SignUpBloc bloc;

  const RegisterFormWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
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
              ),
              const SizedBox(
                height: 8,
              ),
              SignUpButton(
                bloc: widget.bloc,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(S.of(context).alreadyHaveAccount),
                  ),
                  TextButton(
                    onPressed: () {
                      // GoRouter.of(context).go(RouteNames.signIn);
                    },
                    child: Text(S.of(context).signInBtn),
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
