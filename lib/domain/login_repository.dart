
import 'package:tfg_app/data/model/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> login(String username, String password);
}