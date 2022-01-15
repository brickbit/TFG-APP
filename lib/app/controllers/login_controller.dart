import 'package:get/get.dart';
import 'package:tfg_app/app/navigation/app_routes.dart';
import 'package:tfg_app/data/model/login_model.dart';
import 'package:tfg_app/domain/login_repository.dart';

class LoginController extends GetxController with StateMixin<LoginModel?>{

  LoginController({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  void onInit() {
    super.onInit();
  }

  void login(String username, String password) {
    loginRepository.login(username, password).then((data) {
      change(data, status: RxStatus.success());
      Get.toNamed(Routes.HOME);
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}