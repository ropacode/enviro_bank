part of 'package:enviro_bank/src/bloc/home/home_bloc.dart';

class HomeService extends Equatable {
  final WebClient _webClient;

  @override
  List<Object> get props => [_webClient];

  const HomeService({
    required WebClient webClient,
  }) : _webClient = webClient;

  FutureOr<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Config.tokenKey);
  }

  Future<bool> submitApplication(LoanApplication application) async {
    final response = await _webClient.post(
      endpoint: '/loans',
      body: {
        "amount": application.loanAmount,
        "bankAccount": {
          "accountNumber": int.tryParse(application.bankAccountNumber!),
          "bankName": application.bankName,
          "branchCode": 250060
        },
        "collectionDate": application.collectionDateFormatted,
        "firstName": application.firstName,
        "idNumber": int.tryParse(application.idNumber!),
        "lastName": application.lastName
      },
    );
    if (![200, 201].contains(response?.statusCode)) return false;
    final decoded = json.decode(response!.body);
    return decoded['approved'] == true;
  }
}
