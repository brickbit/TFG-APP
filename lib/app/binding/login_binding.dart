
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/login_controller.dart';
import 'package:tfg_app/data/login_provider.dart';
import 'package:tfg_app/data/repository/login_repository_impl.dart';
import 'package:tfg_app/domain/login_repository.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProviderImpl());
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => LoginController(loginRepository: Get.find()));
  }

}