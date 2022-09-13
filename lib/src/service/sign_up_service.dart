part of 'package:enviro_bank/src/bloc/sign_up/sign_up_bloc.dart';

class SignUpService extends Equatable {
  final WebClient _webClient;

  const SignUpService({
    required WebClient webClient,
  }) : _webClient = webClient;

  Future<bool> registerAccount({
    required String email,
    required String password,
  }) async {
    final response = await _webClient.post(
      endpoint: '/users',
      body: {
        'emailAddress': email,
        'password': password,
      },
    );
    if (response?.statusCode != 200) return false;
    final decoded = json.decode(response!.body);
    return decoded['success'] == true;
  }

  @override
  List<Object> get props => [_webClient];
}
