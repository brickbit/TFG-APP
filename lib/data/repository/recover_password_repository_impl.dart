
import 'package:tfg_app/data/model/recover_password_model.dart';
import 'package:tfg_app/domain/repository/recover_password_repository.dart';
import '../../domain/provider/recover_password_provider.dart';

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