
import 'package:tfg_app/app/controllers/recover_password_controller.dart';
import 'package:tfg_app/data/provider/recover_password_provider.dart';
import 'package:tfg_app/data/repository/recover_password_repository_impl.dart';
import 'package:tfg_app/domain/repository/recover_password_repository.dart';
import 'package:get/get.dart';
import '../../domain/provider/recover_password_provider.dart';

class RecoverPasswordBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<RecoverPasswordProvider>(() => RecoverPasswordProviderImpl());
    Get.lazyPut<RecoverPasswordRepository>(() => RecoverPasswordRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => RecoverPasswordController(recoverPasswordRepository: Get.find()));
  }

}