
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/department_controller.dart';
import 'package:tfg_app/data/department_provider.dart';
import 'package:tfg_app/data/repository/department_repository_impl.dart';
import 'package:tfg_app/domain/department_repository.dart';

class DepartmentBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DepartmentProvider>(() => DepartmentProviderImpl());
    Get.lazyPut<DepartmentRepository>(() => DepartmentRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => DepartmentController(dataRepository:  Get.find(),));
  }

}