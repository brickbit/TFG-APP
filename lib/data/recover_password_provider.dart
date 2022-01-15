
import 'package:get/get_connect/connect.dart';
import 'package:tfg_app/data/model/login_model.dart';

abstract class RecoverPasswordProvider {
  Future<Response<LoginModel>> recoverPassword(String path);
}

class RecoverPasswordProviderImpl extends GetConnect implements RecoverPasswordProvider {
  @override
  void onInit() {
    //httpClient.defaultDecoder = LoginModel.fromJson;
    //httpClient.baseUrl = 'https://api.covid19api.com';
  }

  @override
  Future<Response<LoginModel>> recoverPassword(String path) => get(path);
}