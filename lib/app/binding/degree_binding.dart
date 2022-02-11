
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/data/provider/degree_provider.dart';
import 'package:tfg_app/data/repository/degree_repository_impl.dart';
import 'package:tfg_app/domain/repository/degree_repository.dart';

import '../../domain/provider/degree_provider.dart';

class DegreeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DegreeProvider>(() => DegreeProviderImpl());
    Get.lazyPut<DegreeRepository>(() => DegreeRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => DegreeController(dataRepository:  Get.find(),));
  }

}