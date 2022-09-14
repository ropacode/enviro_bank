import 'package:enviro_bank/src/bloc/init/init_cubit.dart';
import 'package:enviro_bank/ui/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitCubit, InitState>(
      listener: (context, state) {
        if (state is SignedOutState) {
          GoRouter.of(context).replace(RouteNames.signUp);
        } else if (state is SignedInState) {
          GoRouter.of(context).replace(RouteNames.home);
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
