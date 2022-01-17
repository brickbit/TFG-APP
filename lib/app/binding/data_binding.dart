
import 'package:get/get.dart';
import 'package:tfg_app/app/controllers/degree_controller.dart';
import 'package:tfg_app/data/data_provider.dart';
import 'package:tfg_app/data/repository/data_repository_impl.dart';
import 'package:tfg_app/domain/data_repository.dart';

class DataBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DataProvider>(() => DataProviderImpl());
    Get.lazyPut<DataRepository>(() => DataRepositoryImpl(provider: Get.find()));
    Get.lazyPut(() => DegreeController(dataRepository:  Get.find(),));
  }

}