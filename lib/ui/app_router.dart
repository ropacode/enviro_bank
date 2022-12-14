import 'package:enviro_bank/src/bloc/home/home_bloc.dart';
import 'package:enviro_bank/src/bloc/init/init_cubit.dart';
import 'package:enviro_bank/src/bloc/sign_in/sign_in_bloc.dart';
import 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:enviro_bank/src/config.dart';
import 'package:enviro_bank/src/service/auth_service.dart';
import 'package:enviro_bank/src/service/web_client.dart';
import 'package:enviro_bank/ui/home/home_screen.dart';
import 'package:enviro_bank/ui/route_names.dart';
import 'package:enviro_bank/ui/sign_in/sign_in_screen.dart';
import 'package:enviro_bank/ui/sign_up/sign_up_screen.dart';
import 'package:enviro_bank/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter get goRouter => GoRouter(
        initialLocation: RouteNames.initialRoute,
        routes: <GoRoute>[
          GoRoute(
            path: RouteNames.initialRoute,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<InitCubit>(
                create: (context) => InitCubit(
                  service: InitService(),
                )..initialize(),
                child: const SplashScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.signUp,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<SignUpBloc>(
                create: (context) => SignUpBloc(
                  service: const AuthService(
                    webClient: WebClient(
                      baseUrl: Config.baseUrl,
                    ),
                  ),
                ),
                child: const SignUpScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.signIn,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(
                  service: const AuthService(
                    webClient: WebClient(
                      baseUrl: Config.baseUrl,
                    ),
                  ),
                ),
                child: const SignInScreen(),
              );
            },
          ),
          GoRoute(
            path: RouteNames.home,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, String>;
              return BlocProvider<HomeBloc>(
                create: (context) => HomeBloc(
                  service: HomeService(
                    webClient: WebClient(
                      baseUrl: Config.baseUrl,
                      jwtToken: extra['token'],
                    ),
                  ),
                ),
                child: const HomeScreen(),
              );
            },
          ),
        ],
      );
}
