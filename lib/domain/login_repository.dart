
import 'package:tfg_app/data/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> login(String username, String password);
}