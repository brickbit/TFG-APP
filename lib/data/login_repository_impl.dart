
import 'package:tfg_app/data/login_model.dart';
import 'package:tfg_app/domain/login_repository.dart';

import 'login_provider.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.provider});

  final LoginProvider provider;

  @override
  Future<LoginModel?> login(String username, String password) async {
    final loginResponseOk = LoginResponseOk(jwt: "jwt");
    return LoginModel(responseOk: loginResponseOk, responseKo: null);
    /*final result = await provider.login("/login", username, password);
    if (result.status.hasError) {
      return Future.error(result.status);
    } else {
      return result.body;
    }*/
  }
}