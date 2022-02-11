import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/classroom_controller.dart';
import 'package:tfg_app/data/provider/classroom_provider.dart';
import 'package:tfg_app/data/repository/classroom_repository_impl.dart';
import 'package:tfg_app/domain/repository/classroom_repository.dart';
import '../../domain/provider/classroom_provider.dart';

class ClassroomBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ClassroomProvider>(() => ClassroomProviderImpl());
    Get.lazyPut<ClassroomRepository>(() => ClassroomRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => ClassroomController(dataRepository:  Get.find(),));
  }

}