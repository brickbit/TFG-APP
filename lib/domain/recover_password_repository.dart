
import 'package:tfg_app/data/recover_password_model.dart';

abstract class RecoverPasswordRepository {
  Future<RecoverPasswordModel> recoverPassword(String mail);
}