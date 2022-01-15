
import 'package:tfg_app/data/model/recover_password_model.dart';

abstract class RecoverPasswordRepository {
  Future<RecoverPasswordModel> recoverPassword(String mail);
}