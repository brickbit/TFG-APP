
import 'package:get/get.dart';
import 'package:tfg_app/data/recover_password_model.dart';
import 'package:tfg_app/domain/recover_password_repository.dart';
import 'package:tfg_app/navigation/app_routes.dart';

class RecoverPasswordController extends GetxController with StateMixin<RecoverPasswordModel>{

  RecoverPasswordController({required this.recoverPasswordRepository});

  final RecoverPasswordRepository recoverPasswordRepository;

  void recoverPassword(String mail) {
    recoverPasswordRepository.recoverPassword(mail).then((data) {
      change(data, status: RxStatus.success());
      Get.toNamed(Routes.LOGIN);
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}