part of 'package:enviro_bank/src/bloc/init/init_cubit.dart';


class InitService extends Equatable {
  @override
  List<Object> get props => [];

  Future<String?> getJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');

  }
}
