
import 'package:get/get_connect/connect.dart';
import 'package:tfg_app/data/model/login_model.dart';
import '../../domain/provider/recover_password_provider.dart';

class RecoverPasswordProviderImpl extends GetConnect implements RecoverPasswordProvider {
  @override
  void onInit() {
    //httpClient.defaultDecoder = LoginModel.fromJson;
    //httpClient.baseUrl = 'https://api.covid19api.com';
  }

  @override
  Future<Response<LoginModel>> recoverPassword(String path) => get(path);
}