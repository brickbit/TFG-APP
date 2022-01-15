
import 'package:tfg_app/data/recover_password_model.dart';
import 'package:tfg_app/data/recover_password_provider.dart';
import 'package:tfg_app/domain/recover_password_repository.dart';

class RecoverPasswordRepositoryImpl implements RecoverPasswordRepository {
  RecoverPasswordRepositoryImpl({required this.provider});

  final RecoverPasswordProvider provider;

  @override
  Future<RecoverPasswordModel> recoverPassword(String mail) async {
    return RecoverPasswordModel(result: true);
    /*final result = await provider.login("/login", username, password);
    if (result.status.hasError) {
      return Future.error(result.status);
    } else {
      return result.body;
    }*/
  }
}