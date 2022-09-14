import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/model/bank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplianceWidget extends StatelessWidget {
  const ComplianceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, next) => next is BankOrDateChangedState,
      builder: (context, state) {
        if (state is BankOrDateChangedState && state.selectedBank == Bank.vbs) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(S.of(context).vbsWarning),
          );
        }
        return const SizedBox();
      },
    );
  }
}
