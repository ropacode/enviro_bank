import 'package:enviro_bank/generated/l10n.dart';
import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<HomeBloc>().add(const BeginApplicationEvent());
        },
        child: Text(S.of(context).applyForLoan),
      ),
    );
  }
}
