
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/data/degree_provider.dart';
import 'package:tfg_app/data/repository/degree_repository_impl.dart';
import 'package:tfg_app/domain/degree_repository.dart';

class DataBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DegreeProvider>(() => DegreeProviderImpl());
    Get.lazyPut<DegreeRepository>(() => DegreeRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => DegreeController(dataRepository:  Get.find(),));
  }

}