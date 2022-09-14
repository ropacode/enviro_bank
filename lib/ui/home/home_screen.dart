import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/ui/home/application_form_widget.dart';
import 'package:enviro_bank/ui/home/submitting_application_widget.dart';
import 'package:enviro_bank/ui/home/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homeTitle),
        actions: [
          PopupMenuButton(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                Icons.more_vert,
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(S.of(context).signOutBtn),
                  onTap: () {},
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (prev, next) =>
            next is ApplicationApprovedState ||
            next is ApplicationFailedState ||
            next is InvalidApplicationState,
        listener: (context, state) {
          String? content;
          if (state is ApplicationApprovedState) {
            content = S.of(context).applicationApproved(
                  state.application.firstName!,
                  state.application.lastName!,
                  state.application.loanAmount!,
                );
          } else if (state is ApplicationFailedState) {
            content = S.of(context).applicationDenied;
          } else if (state is InvalidApplicationState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).missingData),
              ),
            );
          }
          if (content != null) {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  AlertDialog(
                content: Text(content!),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).okBtn),
                  ),
                ],
              ),
            );
          }
        },
        buildWhen: (prev, next) =>
            next is HomeInitialState ||
            next is SubmittingApplicationState ||
            next is ApplicationApprovedState ||
            next is HomeBeginApplyState ||
            next is ApplicationFailedState,
        builder: (context, state) {
          if (state is HomeInitialState) {
            return const WelcomeWidget();
          } else if (state is SubmittingApplicationState) {
            return const SubmittingApplicationWidget();
          }
          return const ApplicationFormWidget();
        },
      ),
    );
  }
}
