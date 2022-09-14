import 'package:enviro_bank/src/bloc/auth/auth_bloc.dart';
import 'package:enviro_bank/src/service/auth_service.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends AuthBloc {
  SignInBloc({
    required AuthService service,
  }) : super(const SignInInitialState(), service: service);

  @override
  bool validPassword(String password) {
    return password.isNotEmpty;
  }
}
