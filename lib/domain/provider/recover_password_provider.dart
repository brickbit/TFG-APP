
import 'package:get/get_connect/connect.dart';
import 'package:tfg_app/data/model/login_model.dart';

abstract class RecoverPasswordProvider {
  Future<Response<LoginModel>> recoverPassword(String path);
}