
import 'package:get/get_connect/connect.dart';
import 'package:tfg_app/data/model/login_model.dart';

import '../../domain/provider/login_provider.dart';

class LoginProviderImpl extends GetConnect implements LoginProvider {
  @override
  void onInit() {
    //httpClient.defaultDecoder = LoginModel.fromJson;
    //httpClient.baseUrl = 'https://api.covid19api.com';
  }

  @override
  Future<Response<LoginModel>> login(String path) => get(path);
}